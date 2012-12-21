class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :name
      t.string :type_of_food
      t.string :name_of_food
      t.integer :quantity
      t.integer :rate_per_person
      t.references :event

      t.timestamps
    end
    add_index :participants, :event_id
  end
end
