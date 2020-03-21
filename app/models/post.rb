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
  has_many :comments
  belongs_to :source
end
