class Contact < ActiveRecord::Base
  #not using this class presently but didn't remove because I didn't want to deal with fixing the migrations
  belongs_to :trip
  attr_accessible :email, :trip_id
end
