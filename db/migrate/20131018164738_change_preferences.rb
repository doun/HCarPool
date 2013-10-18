class ChangePreferences < ActiveRecord::Migration
    def change
    	drop_table :preferences
    create_table :preferences do |t|
      t.references :user
      t.string :copassangerGender
      t.boolean :acNonac
      t.string :carModel
      t.integer :maxCapacity
      t.string :from
      t.string :to
      t.time :startTime

      t.timestamps
    end
    add_index :preferences, :user_id
  end
end
