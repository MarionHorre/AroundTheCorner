class CreateTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :types do |t|
      t.string :category
      t.string :name

      t.timestamps
    end
  end
end
