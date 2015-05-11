class Item < ActiveRecord::Base
  belongs_to :destination_specific_activity
  has_many :line_items
  attr_accessible :name, :price
end
