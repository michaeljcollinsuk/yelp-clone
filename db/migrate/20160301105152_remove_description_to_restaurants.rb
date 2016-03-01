class RemoveDescriptionToRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :descriptions, :text
  end
end
