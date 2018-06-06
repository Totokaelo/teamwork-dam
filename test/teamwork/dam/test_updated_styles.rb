# frozen_string_literal: true

require 'test_helper'
require 'teamwork/dam/updated_styles'

class TestTeamworkDamUpdatedStyles < Minitest::Test
  def test_simple_get_updated_styles
    instance = build_updated_styles

    r = instance.next
    r2 = instance.next

    refute_nil r
    refute_nil r2
    refute_equal r, r2
  end

  def build_updated_styles
    Teamwork::Dam::UpdatedStyles.new(
      client: dam_client,
      modified_after: Time.now - (3600 * 24)
    )
  end

  def dam_client
    Teamwork::Dam::Client.new(access_token: test_settings['dam_api_key'])
  end
end
