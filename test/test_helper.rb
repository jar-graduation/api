require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def json
    @json ||= JSON.parse(response.body)
  end

  def assert_presence(obj, attribute)
    error_message = obj.errors.get(attribute);
    assert (error_message.include? "can't be blank"), error_message
  end

  def assert_uniqueness(obj, attribute)
    error_message = obj.errors.get(attribute);
    assert (error_message.include? ""), error_message
  end

end
