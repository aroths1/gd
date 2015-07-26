class Item < ActiveRecord::Base
  belongs_to :destination_specific_activity
  has_many :line_items #, inverse_of: :item
  attr_accessible :name, :price, :destination_specific_activity
  validates :name, :price, :destination_specific_activity_id, presence: true
  validates :name, uniqueness: {scope: :destination_specific_activity_id}
  validates :price, numericality: {greater_than_or_equal_to: 0}
end
