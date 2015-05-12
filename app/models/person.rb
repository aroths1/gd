class Person < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :mobile_phone
  
  def to_s
    self.first_name + ' ' + self.last_name
  end
end
