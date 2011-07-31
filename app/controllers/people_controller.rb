class PeopleController < ApplicationController
  def index

    @postcodes = People.postcodes
    @email_domains = People.email_domains

    if(params[:email_option] || params[:postcode_option])
      #TODO sanitise params
      @results = People.do_search(params[:email_option], params[:email], params[:postcode_option], params[:postcode])
    end
  end

end
