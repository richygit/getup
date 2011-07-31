class People < ActiveRecord::Base

  class << self
    def postcodes
      #TODO memcache?
      People.find_by_sql "SELECT postcode FROM people GROUP BY postcode"
    end

    def email_domains
      #TODO memcache?
      People.find_by_sql "SELECT email_domain FROM people GROUP by email_domain"
    end

    #perform search for people based on email or postcode
    def do_search(email_option, email, postcode_option, postcode)
      if(email_option == 'include' && email )
        email_conditions = " email_domain IN ('" << email.join("','") << "') "
      elsif(email_option == 'exclude' && email )
        email_conditions = " email_domain NOT IN ('" << email.join("','") << "') "
      end

      if(postcode_option == 'include' && postcode)
        postcode_conditions = " postcode IN ('" << postcode.join("','") << "') "
      elsif(postcode_option == 'exclude' && postcode)
        postcode_conditions = " postcode NOT IN ('" << postcode.join("','") << "') "
      end

      return People.where(email_conditions).where(postcode_conditions).all
    end
  end
end
