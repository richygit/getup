require 'CSV'

namespace :data do


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

  task :initialise_data => :environment do
    load_postcodes
    load_people
  end
end

