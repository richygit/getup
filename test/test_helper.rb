ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # assert that the search form exists
  def assert_search_form
    assert_select "#search-form" do
      assert_select "#email_option_include"
      assert_select "#email_option_exclude"
      assert_select "#email"
      assert_select "#postcode_option_include"
      assert_select "#postcode_option_exclude"
      assert_select "#postcode"
      assert_select "#search-button"
    end
  end
end
