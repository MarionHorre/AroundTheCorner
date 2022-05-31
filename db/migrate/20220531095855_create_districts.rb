class CreateDistricts < ActiveRecord::Migration[6.1]
  def change
    create_table :districts do |t|
      t.string :name
      t.string :description
      t.string :image
      t.references :interest, null: false, foreign_key: true

      t.timestamps
    end
  end
end
