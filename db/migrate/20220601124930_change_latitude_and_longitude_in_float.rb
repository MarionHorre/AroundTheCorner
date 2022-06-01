class ChangeLatitudeAndLongitudeInFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :interests, :longitude, :float
    change_column :interests, :latitude, :float
  end
end
