# == Schema Information
# Schema version: 20200331111411
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string
#  body       :text
#  author     :string
#  source_id  :integer          indexed, indexed => [handle], indexed => [status]
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  handle     :string           indexed => [source_id]
#  sync_date  :datetime
#  status     :integer          default("0"), indexed => [source_id]
#
require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
