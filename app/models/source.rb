# == Schema Information
# Schema version: 20200330193418
#
# Table name: sources
#
#  id         :bigint           not null, primary key
#  name       :string
#  url        :string
#  connector  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :integer          default("0")
#
class Source < ApplicationRecord
  has_many :posts, dependent: :destroy

  enum status: %i[pending synchronizing synchronized]

  def sync_posts
    return false unless connector_instance
    synchronizing!
    SyncSourcePostsJob.perform_later(source_id: id)
    true
  end

  def sync_comments
    return false unless connector_instance
    posts_synchronized = posts.map { |post| post.sync_comments(connector_instance) }
    posts_synchronized.all?(&:present?)
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
end
