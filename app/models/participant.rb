class Participant < ActiveRecord::Base
  belongs_to :event
  attr_accessible :name, :name_of_food, :quantity, :rate_per_person, :type_of_food

  validates :name, :name_of_food, :presence => true
  validates :quantity, :rate_per_person, :numericality => true, :allow_nil => false

end