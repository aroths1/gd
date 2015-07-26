class User < ActiveRecord::Base
  ROLES = %w[admin user]
  belongs_to :person
  has_many :orders, inverse_of: :user
  has_many :trips, inverse_of: :leader
  validates :mobile_phone, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :mobile_phone
  # attr_accessible :title, :body
  
  def to_s
    self.first_name + ' ' + self.last_name
  end
  
  def is_trip_leader?(trip)
    self.id == trip.leader.id
  end
  
  def admin?
    self.role == 'admin'
  end
end
