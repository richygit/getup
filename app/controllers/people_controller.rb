class PeopleController < ApplicationController
  def index

    @postcodes = People.find_by_sql "SELECT postcode FROM people GROUP BY postcode"

    puts @postcodes
  end


end
