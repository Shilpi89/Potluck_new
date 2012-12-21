class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :date_of_event
      t.string :venue
      t.text :description
      t.string :organizing_team

      t.timestamps
    end
  end
end
