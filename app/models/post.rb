# == Schema Information
# Schema version: 20200321155123
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string
#  body       :text
#  author     :string
#  source_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  handle     :string
#
class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :source

  def sync_comments(source_connector = nil)
    source_connector ||= source.connector_instance
    return false unless source_connector
    comments.destroy_all
    post_comments = source_connector.fetch_post_comments(handle)
    post_comments.map(&method(:create_single_comment)).all?(&:present?)
  end

  private

  def create_single_comment(comment_data)
    comment = comments.new(comment_data)
    comment.save
  end
end
