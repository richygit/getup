class Person < ActiveRecord::Base
  belongs_to :postcode

  class << self

    def email_domains
      #TODO memcache?
      Person.select(:email_domain).group(:email_domain).order(:email_domain)
    end

    # sanitise the email array for use in db query
    def sanitise_email(email)
      return nil if email.blank?
      #remove all non-word chars
      email.collect{ |e| e.gsub(/[^\w]-/,'')}
      return email
    end

    #sanitise the postcode array for use in db query
    def sanitise_postcode(postcode)
      return nil if postcode.blank?
      #remove all non-numeric chars
      postcode.collect{ |p| p.to_s.gsub(/[^\d]/, '')}
      return postcode
    end

    # perform search for people based on email or postcode
    def search(email_option, email, postcode_option, postcode)
      email = sanitise_email(email)
      postcode = sanitise_postcode(postcode)

      query = Person.joins(:postcode)
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

      return query.order(:name).all
    end
  end
end
