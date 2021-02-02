class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :firstname, default: ''
      t.string :lastname, default: ''
      t.string :city, default: "New York City"
      t.string :state, default: "New York"
      t.text :bio, default: ''
      t.string :pic, default: 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'

      t.timestamps
    end
  end
end
