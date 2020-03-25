# == Schema Information
# Schema version: 20200315185934
#
# Table name: sources
#
#  id         :bigint           not null, primary key
#  name       :string
#  url        :string
#  connector  :string
#  sync_date  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Source < ApplicationRecord
  has_many :posts

  def sync_posts
    posts.destroy_all
    connector_class = fetch_connector_class
    return false unless connector_class
    api_posts = connector_class.new.fetch_all_posts
    api_posts.map(&method(:create_single_post)).all?(&:present?)
  end

  private

  def fetch_connector_class
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
