class CreateUserResources < ActiveRecord::Migration
  def change
    create_table :user_resources do |t|
      t.references :user
      t.boolean :acNonac
      t.string :carModel
      t.integer :maxCapacity
      t.string :imageUrl
      t.string :carNumber
      t.boolean :isOwned
      t.string :driverName
      t.boolean :isSelfDrive

      t.timestamps
    end
    add_index :user_resources, :user_id
  end
end
