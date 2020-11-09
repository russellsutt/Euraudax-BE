class CreateRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :routes do |t|
      t.string :title
      t.string :description
      t.integer :distance
      t.integer :elevation
      t.integer :estimated_time
      t.string :polyline
      t.belongs_to :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
