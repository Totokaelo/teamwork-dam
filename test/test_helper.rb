# test/test_helper.rb
require 'minitest/autorun'
require 'minitest/pride'
require 'yaml'

# Add lib to load path
$: << File.join(File.split(__FILE__)[0], '../lib')

# Enviroment variables.
def test_settings
  test_settings_file = File.join(File.split(__FILE__)[0], 'settings.yml')

  if File.exists?(test_settings_file)
    YAML.load(File.read(test_settings_file))
  else
    {}
  end
end
