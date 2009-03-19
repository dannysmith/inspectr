require 'test_helper'

class CadetTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Cadet.new.valid?
  end
end
