class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.resource_schedule_id :requester
      t.resource_schedule_id :requestfor
      t.boolean :isConfirmed
      t.string :requesttype

      t.timestamps
    end
  end
end
