class People < ActiveRecord::Base
  belongs_to :postcode

  class << self

    def email_domains
      #TODO memcache?
      People.select(:email_domain).group(:email_domain)
      #People.find_by_sql "SELECT email_domain FROM people GROUP by email_domain"
    end

    #perform search for people based on email or postcode
    def do_search(email_option, email, postcode_option, postcode)
      query = People.joins(:postcode)
      if(email_option == 'include' && email )
        query = query.where(:email_domain => email)
      elsif(email_option == 'exclude' && email )
        query = query.where("email_domain NOT IN (?)", email)
      end

      if(postcode_option == 'include' && postcode)
        query = query.where(:postcodes => {:number => postcode})
      elsif(postcode_option == 'exclude' && postcode)
        query = query.where("postcodes.number NOT in (?)", postcode )
      end

      return query.all
    end
  end
end
