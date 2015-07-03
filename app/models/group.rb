class Group < ActiveRecord::Base
  has_many :trips
  belongs_to :contact, class_name: 'User', foreign_key: :contact
  attr_accessible :contact, :name
  
  def to_s
    self.name
  end
end
