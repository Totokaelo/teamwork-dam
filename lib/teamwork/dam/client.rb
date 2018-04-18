# frozen_string_literal: true

require 'curb'
require 'json'

module Teamwork
  module Dam
    # DAM interactions client.
    class Client
      def initialize(access_token:)
        @endpoint = 'https://teamwork-dam.appspot.com/'
        @access_token = access_token
      end

      # Get images associated by style number.
      def get_style(style_number)
        json = execute(
          'external-api/media/get-style',
          'styleNo': style_number
        )

        json.dig('style', 'images')
      end

      private

      attr_reader :endpoint, :access_token

      def execute(path, data)
        endpoint_url = "#{@endpoint}/#{path}"
        data_json = JSON.generate(data)

        http = Curl.post(endpoint_url, data_json) do |curl|
          curl.headers['Content-Type'] = 'application/json'
          curl.headers['Access-Token'] = access_token
        end

        JSON.parse(http.body_str)
      end
    end
  end
end
