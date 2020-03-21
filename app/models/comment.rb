# == Schema Information
# Schema version: 20200321143709
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  author     :string
#  body       :text
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord
  belongs_to :post
end