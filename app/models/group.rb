class Group < ActiveRecord::Base
  has_many :trips
  belongs_to :contact, class_name: 'Person', foreign_key: :contact
  attr_accessible :contact, :name
end
