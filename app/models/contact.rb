class Contact < ActiveRecord::Base
  belongs_to :trip
  attr_accessible :email, :trip_id
end
