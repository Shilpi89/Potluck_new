class CreateEventsOrganizers < ActiveRecord::Migration
  def change
    create_table :events_organizers do |t|
      t.integer :event_id
      t.integer :organizer_id

    end
  end
end
