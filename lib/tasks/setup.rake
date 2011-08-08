require File.expand_path('../../../test/test_helper', __FILE__)

namespace :db  do
  desc "setup database with initial data"
  task :initial_data  do
    ActiveSupport::TestCase.new('initial_data').load_postcodes
    ActiveSupport::TestCase.new('initial_data').load_people
  end
end