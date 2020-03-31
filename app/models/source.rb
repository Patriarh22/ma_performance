# == Schema Information
# Schema version: 20200328152957
#
# Table name: sources
#
#  id         :bigint           not null, primary key
#  name       :string
#  url        :string
#  connector  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Source < ApplicationRecord
  has_many :posts, dependent: :destroy

  enum status: %i[pending synchronizing synchronized]

  def sync_posts
    return false unless connector_instance
    synchronizing!
    SyncSourcePostsJob.perform_later(source_id: id)
    true
    # posts.destroy_all
    # api_posts = connector_instance.fetch_all_posts
    # api_posts.map(&method(:create_single_post)).all?(&:present?)
  end

  def sync_comments
    return false unless connector_instance
    synchronizing!
    posts.update_all(status: :synchronizing)
    SyncCommentsJob.perform_later(source_id: id)
    true
    # posts_synchronized = posts.map { |post| post.sync_comments(connector_instance) }
    # posts_synchronized.all?(&:present?)
  end

  def connector_instance
    @connector_instance ||= connector_class&.new
  end

  private

  def connector_class
    connector_name = connector.to_s.classify
    "ApiConnector::#{connector_name}ApiConnector".constantize
  rescue NameError => _
    nil
  end

  def create_single_post(post_data)
    post = posts.new(post_data)
    post.save
  end
end
