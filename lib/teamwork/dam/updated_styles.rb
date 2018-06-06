# frozen_string_literal: true

require 'teamwork/dam/client'

module Teamwork
  module Dam
    # Cursor over all updated styles. Return the style numbers of updated
    # products.
    class UpdatedStyles
      # Documentation says 30, error message says 30, actual API behavior is 29
      WINDOW_SIZE = 29

      # Need to indicate that we're at the end of the cursor
      CURSOR_END = 'end'.freeze

      def initialize(client:, modified_after:)
        @client = client

        # Teamwork wants timestamp in milliseconds, lol.
        @timestamp = case modified_after
                     when Time    then modified_after.to_i * 1000
                     when Integer then modified_after
                     else raise ArgumentError, 'Cannot handle ' \
                                               "#{modified_after.class}"
                     end

        @cursor = nil
      end

      # Grabs the next page of styles.
      #
      def next
        return nil if @cursor == CURSOR_END

        response = get_updated_styles(@cursor)
        @cursor = response['cursor'] || CURSOR_END

        if response['styles'].any?
          response['styles'].map do |style_hash|
            style_hash['styleNo']
          end
        else
        end
      end

      private

      attr_reader :client, :timestamp

      # Call Teamwork
      def get_updated_styles(cursor = nil)
        response = client.get_updated_styles(
          limit: WINDOW_SIZE,
          cursor: cursor,
          modified_after: timestamp
        )

        response
      end
    end
  end
end
