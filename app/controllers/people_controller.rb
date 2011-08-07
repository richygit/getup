class PeopleController < ApplicationController
  def index

    @postcodes = Postcode.find :all
    @email_domains = Person.email_domains

    if(params[:email_option] || params[:postcode_option])
      @people = Person.do_search(params[:email_option], params[:email], params[:postcode_option], params[:postcode])
    end
  end

end
