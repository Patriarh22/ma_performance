# == Schema Information
# Schema version: 20200331092951
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
#  sync_date  :datetime
#  status     :integer          default("0")
#
class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :source

  enum status: %i[pending synchronizing synchronized]

  def sync_comments(source_connector = nil)
    synchronizing!
    SyncCommentsJob.perform_later(source_id: source_id, post_id: id)
  end

  def humanized_date_time
    return '' unless sync_date
    sync_date.strftime("%Y/%m/%d %H:%M")
  end

  private

  def create_single_comment(comment_data)
    comment = comments.new(comment_data)
    comment.save
  end
end
