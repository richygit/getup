require 'factory_girl_rails'

# define factory for loading people
FactoryGirl.define do
  # This will use the User class (Admin would have been guessed)
  factory :person, :class => People do
    email 'email'
    name 'first last'
    postcode_id '3'
    email_domain { email.gsub(/[^@]*@/, '').gsub(/\..*/, '') } #strip out everything except for email domain
  end

end