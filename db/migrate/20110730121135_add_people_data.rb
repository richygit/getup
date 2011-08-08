class AddPeopleData < ActiveRecord::Migration
  def self.up
    People.create :name => 'Cody Kinnaman', :email => 'ck@hotmail.com', :email_domain => 'hotmail', :postcode => '2000'
    People.create :name => 'Christian Hoying', :email => 'ch@gmail.com', :email_domain => 'gmail', :postcode => '2010'
    People.create :name => 'Max Moshier', :email => 'mm@gmail.com', :email_domain => 'gmail', :postcode => '2060'
    People.create :name => 'Noreen Zacharias', :email => 'nz@yahoo.com.au', :email_domain => 'yahoo', :postcode => '2061'
    People.create :name => 'Darren Radovich', :email => 'dr@yahoo.com.au', :email_domain => 'yahoo', :postcode => '2065'
    People.create :name => 'Erik Pendergast', :email => 'ep@gmail.co.nz', :email_domain => 'gmail', :postcode => '2000'
    People.create :name => 'Ted Kuehne', :email => 'tk@hotmail.co.nz', :email_domain => 'hotmail', :postcode => '2010'
    People.create :name => 'Clinton Banegas', :email => 'cb@yahoo.com', :email_domain => 'yahoo', :postcode => '2060'
    People.create :name => 'Neil Ancona', :email => 'na@gmail.com.au', :email_domain => 'gmail', :postcode => '2061'
    People.create :name => 'Clare Straube', :email => 'cs@yahoo.co.nz', :email_domain => 'yahoo', :postcode => '2065'
  end

  def self.down
    if People.find_by_email('ck@hotmail.com')
      People.find_by_email('ck@hotmail.com').delete
    end

    if People.find_by_email('ch@gmail.com')
      People.find_by_email('ch@gmail.com').delete
    end

    if People.find_by_email('mm@gmail.com')
      People.find_by_email('mm@gmail.com').delete
    end

    if People.find_by_email('nz@yahoo.com.au')
      People.find_by_email('nz@yahoo.com.au').delete
    end

    if People.find_by_email('dr@yahoo.com.au')
      People.find_by_email('dr@yahoo.com.au').delete
    end

    if People.find_by_email('ep@gmail.co.nz')
      People.find_by_email('ep@gmail.co.nz').delete
    end

    if People.find_by_email('tk@hotmail.co.nz')
      People.find_by_email('tk@hotmail.co.nz').delete
    end

    if People.find_by_email('cb@yahoo.com')
      People.find_by_email('cb@yahoo.com').delete
    end

    if People.find_by_email('na@gmail.com.au')
      People.find_by_email('na@gmail.com.au').delete
    end

    if People.find_by_email('cs@yahoo.co.nz')
      People.find_by_email('cs@yahoo.co.nz').delete
    end


  end
end
