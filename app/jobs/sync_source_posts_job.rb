class SyncSourcePostsJob < ApplicationJob
  queue_as :api_sync

  def perform(*args)
    options = extract_symbolized_options(args)
    source = find_source(options[:source_id])
    return unless source&.connector_instance
    api_posts = source.connector_instance.fetch_all_posts
    post_handles = api_posts.map { |post_data| post_data[:handle] }
    create_new_posts(source, api_posts, post_handles)
    destroy_redundant_posts(source, post_handles)
    source.synchronized!
  end

  private

  def extract_symbolized_options(args)
    options = args.extract_options!
    options.symbolize_keys
  end

  def find_source(source_id)
    return nil unless source_id
    Source.find_by(id: source_id)
  end

  def create_new_posts(source, api_posts, post_handles)
    existing_post_handles = source.posts.where(handle: post_handles).pluck(:handle)
    absent_posts = api_posts.select { |post_data| existing_post_handles.exclude?(post_data[:handle]) }
    absent_posts.each { |post_data| source.posts.create(post_data) }
  end

  def destroy_redundant_posts(source, post_handles)
    source.posts.where.not(handle: post_handles).destroy_all
  end
end
