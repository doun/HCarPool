class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.references :user_id
      t.string :copassangerGender
      t.boolean :acNonac
      t.string :carModel
      t.integer :maxCapacity
      t.string :from
      t.string :to
      t.time :startTime

      t.timestamps
    end
    add_index :preferences, :user_id_id
  end
end
