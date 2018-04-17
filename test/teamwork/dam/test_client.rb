# test/teamwork/dam/test_client.rb

require 'test_helper'
require 'teamwork/dam/client'

class TestTeamworkDamClient < Minitest::Test
  def test_defined_client
    refute_nil Teamwork::Dam::Client
  end

  def test_get_style
    s = client.get_style("157060")
    refute_nil s
  end

  # TODO: this test is a false positive. We want to test that you can access by both
  #   styleNo and styleID ... this returns empty images, but non-empty response
  def test_get_style
    s = client.get_style("57be00fd-d2dd-4940-acd9-07b7bc67028e")
    refute_nil s
  end

  def client
    Teamwork::Dam::Client.new(access_token: test_settings["dam_api_key"])
  end
end
