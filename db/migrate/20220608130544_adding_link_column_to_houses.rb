class AddingLinkColumnToHouses < ActiveRecord::Migration[6.1]
  def change
    add_column :houses, :link, :string
  end
end
