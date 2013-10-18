class AddAcNonacToResourceSchedules < ActiveRecord::Migration
  def change
	  add_column :resource_schedules, :acNonac, :boolean
  end
end
