class Participant < ActiveRecord::Base
  belongs_to :person
  belongs_to :lead_participant, class_name: 'Person', foreign_key: :lead_participant
  belongs_to :trip
  attr_accessible :lead_participant
end
