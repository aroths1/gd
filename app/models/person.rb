class Person < ActiveRecord::Base
  #This class is not presently used. I'm not sure if I will use it in the future.
  has_one :user
  attr_accessible :email, :first_name, :last_name, :mobile_phone
  
  def to_s
    self.first_name + ' ' + self.last_name
  end
end
