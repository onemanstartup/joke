ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'factory_girl'
require 'minitest/hell'
require 'rr'
class ActionController::TestCase
  include Devise::TestHelpers
end
class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  # ActiveRecord::Migration.maintain_test_schema! if defined?(ActiveRecord::Migration)

  Warden.test_mode!
  include Warden::Test::Helpers

  class << self
    alias_method :context, :describe
  end

  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  include FactoryGirl::Syntax::Methods

end

module MiniTest::Assertions
  def assert_not_authorized
    assert @controller.flash[:error] != nil, 'Passed authorization'
    assert_response :redirect
  end
end
