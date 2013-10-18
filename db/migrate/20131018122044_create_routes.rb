class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.integer :routeno
      t.integer :routeindex
      t.string :area

      t.timestamps
    end
  end
end
