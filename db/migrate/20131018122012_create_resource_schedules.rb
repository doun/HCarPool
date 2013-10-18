class CreateResourceSchedules < ActiveRecord::Migration
  def change
    create_table :resource_schedules do |t|
      t.integer :userResourceId
      t.integer :userId
      t.integer :isowner
      t.string :startplace
      t.string :destination
      t.datetime :starttime
      t.integer :routeno
      t.integer :available
      t.boolean :isconfirmed
      t.boolean :isreadytohire
      t.boolean :ishireconfirmed

      t.timestamps
    end
  end
end
