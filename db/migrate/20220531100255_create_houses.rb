class CreateHouses < ActiveRecord::Migration[6.1]
  def change
    create_table :houses do |t|
      t.string :name
      t.string :image
      t.string :description
      t.integer :price
      t.integer :square_meters
      t.integer :room_number
      t.references :agency, null: false, foreign_key: true
      t.references :district, null: false, foreign_key: true

      t.timestamps
    end
  end
end
