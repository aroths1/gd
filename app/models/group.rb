class Group < ActiveRecord::Base
  has_many :trips #, inverse_of: :group
  belongs_to :contact, class_name: 'User', foreign_key: :contact
  attr_accessible :contact, :name
  validates :name, presence: true
  validates :name, uniqueness: true
  
  def to_s
    self.name
  end
end
