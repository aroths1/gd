class Person < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :mobile_phone
end
