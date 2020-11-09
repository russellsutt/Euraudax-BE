class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.integer :time
      t.string :pace
      t.boolean :archived
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :route, null: false, foreign_key: true

      t.timestamps
    end
  end
end
