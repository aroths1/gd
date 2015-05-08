class Item < ActiveRecord::Base
  belongs_to :destination_specific_activity
  attr_accessible :name, :price
end
