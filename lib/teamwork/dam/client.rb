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

      # Get batches of styles with updated media resources for all items which
      # were updated after specific time
      # @param modifiedAfter will be returned with first batch and should be
      # saved for retrieving only updated data next time
      #
      # Last batch will return empty cursor.
      def get_updated_styles(data = {})
        execute(
          'external-api/media/batch-updated-styles',
          limit: data[:limit] || 29,
          cursor: data[:cursor],
          modifiedAfter: data[:modified_after] || data[:modifiedAfter]
        )
      end

      # Get images associated by style number.
      def get_style(style_number)
        json = execute(
          'external-api/media/get-style',
          'styleNo': style_number
        )

        images = json.dig('style', 'images')

        images || []
      end

      private

      attr_reader :endpoint, :access_token

      def execute(path, data)
        endpoint_url = "#{@endpoint}/#{path}"
        data_json = JSON.generate(data)

        # puts "Data: #{data_json}"
        http = Curl.post(endpoint_url, data_json) do |curl|
          curl.headers['Content-Type'] = 'application/json'
          curl.headers['Access-Token'] = access_token
        end

        JSON.parse(http.body_str)
      end
    end
  end
end
