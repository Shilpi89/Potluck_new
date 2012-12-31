class AddVegToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :veg, :boolean
  end
end
