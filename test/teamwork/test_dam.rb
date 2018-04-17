# test/teamwork/test_dam.rb

require 'test_helper'
require 'teamwork/dam'

class TestTeamworkDam < Minitest::Test
  def test_defined_version
    refute_nil Teamwork::Dam::VERSION
  end

  def test_defined_client
    refute_nil Teamwork::Dam::Client
  end
end
