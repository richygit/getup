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


    # load the people fixture from test/factory_fixtures/people.csv.
    # use the factory to generate the value for email_domain
    def load_people
      people = Hash.new
      i = 0
      CSV.foreach("test/factory_fixtures/people.csv") do |person|
        # skip the header row
        if i > 0
          people[person[0]] = FactoryGirl.create(:person, {:email => person[3], :name => person[1], :postcode_id => person[2] } )
        end
        i += 1
      end

      return people
    end

    def load_postcodes
      postcodes = Hash.new
      i = 0
      CSV.foreach("test/factory_fixtures/postcodes.csv") do |postcode|
        # skip the header row
        if i > 0
          postcodes[postcode[0]] = FactoryGirl.create(:postcode, {:number => postcode[1], :suburb => postcode[2]} )
        end
        i += 1
      end

      return postcodes
    end


end
