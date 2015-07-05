class User < ActiveRecord::Base
  ROLES = %w[admin group_leader lead_participant participant]
  belongs_to :person
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
end
