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
require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
