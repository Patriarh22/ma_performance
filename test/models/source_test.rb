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
require 'test_helper'

class SourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
