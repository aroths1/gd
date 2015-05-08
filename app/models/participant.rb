class Participant < ActiveRecord::Base
  belongs_to :person
  belongs_to :trip
  attr_accessible :lead_participant
end
