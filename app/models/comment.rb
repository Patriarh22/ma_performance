# == Schema Information
# Schema version: 20200331111411
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  author     :string
#  body       :text
#  post_id    :integer          indexed
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord
  belongs_to :post
end
