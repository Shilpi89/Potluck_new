class Participant < ActiveRecord::Base
  belongs_to :event
  attr_accessible :name, :name_of_food, :quantity, :rate_per_person, :type_of_food, :veg

  validates :name, :name_of_food, :presence => true
  validates :quantity, :rate_per_person, :numericality => true, :allow_nil => false


  def fund_amount(id)
    @participant = Participant.where(:event_id => id)
    @each_amount = 0
    @participant.each do |participant|
      @each_amount = @each_amount + ( participant.quantity * participant.rate_per_person )
    end
    @each_amount
  end

end