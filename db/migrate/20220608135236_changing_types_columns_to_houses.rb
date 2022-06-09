class ChangingTypesColumnsToHouses < ActiveRecord::Migration[6.1]
  def change
    change_column :houses, :price, :string
    change_column :houses, :square_meters, :string
    change_column :houses, :room_number, :string
  end
end
