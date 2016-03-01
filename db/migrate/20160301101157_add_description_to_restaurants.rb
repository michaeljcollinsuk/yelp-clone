class AddDescriptionToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :descriptions, :text
  end
end
