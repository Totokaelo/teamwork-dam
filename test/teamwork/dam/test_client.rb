# frozen_string_literal: true

require 'test_helper'
require 'teamwork/dam/client'

class TestTeamworkDamClient < Minitest::Test
  def test_defined_client
    refute_nil Teamwork::Dam::Client
  end

  def test_get_style
    s = client.get_style('157060')
    refute_nil s
  end

  def client
    Teamwork::Dam::Client.new(access_token: test_settings['dam_api_key'])
  end
end
