class Event < ActiveRecord::Base
  attr_accessible :date_of_event, :description, :name, :organizing_team, :venue, :menu
  has_attached_file :menu
    validates :name, :length => { :minimum => 2 }

    validates :description, :presence => true

    #validates :organizing_team, :presence => true

    validates :venue, :presence => true



  has_many :participants, :dependent => :destroy

  has_and_belongs_to_many :users




end
