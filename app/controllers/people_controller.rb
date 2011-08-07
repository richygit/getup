class PeopleController < ApplicationController
  def index

    @postcodes = Postcode.find :all
    @email_domains = People.email_domains

    if(params[:email_option] || params[:postcode_option])
      #TODO sanitise params
      @people = People.do_search(params[:email_option], params[:email], params[:postcode_option], params[:postcode])
    end
  end

end
