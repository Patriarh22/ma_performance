class SyncCommentsJob < ApplicationJob
  queue_as :api_sync

  def perform(*args)
    options = extract_symbolized_options(args)
    source = find_source(options[:source_id])
    return unless source&.connector_instance
    posts = collect_synchronizing_posts(source, options[:post_id])
    posts.each { |post| sync_comments(post, source.connector_instance) }
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

  def collect_synchronizing_posts(source, post_id)
    posts = source.posts.synchronizing
    posts = posts.where(id: post_id) if post_id
    posts
  end

  def sync_comments(post, source_connector)
    post.comments.delete_all
    post_comments = source_connector.fetch_post_comments(post.handle)
    post.comments.create(post_comments)
    post.update(status: :synchronized, sync_date: Time.now)
  end
end
