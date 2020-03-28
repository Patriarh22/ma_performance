# == Schema Information
# Schema version: 20200328152957
#
# Table name: sources
#
#  id         :bigint           not null, primary key
#  name       :string
#  url        :string
#  connector  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class SourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
