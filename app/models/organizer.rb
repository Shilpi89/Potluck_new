class Organizer < ActiveRecord::Base
  attr_accessible :emp_id, :name
  has_and_belongs_to_many :events
end
