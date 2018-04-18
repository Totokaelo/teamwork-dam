# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require 'yaml'

# Add lib to load path
$LOAD_PATH << File.join(File.split(__FILE__)[0], '../lib')

# Enviroment variables.
def test_settings
  test_settings_file = File.join(File.split(__FILE__)[0], 'settings.yml')

  if File.exist?(test_settings_file)
    YAML.safe_load(File.read(test_settings_file))
  else
    {}
  end
end
