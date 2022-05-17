class RemoveListingsFromListings < ActiveRecord::Migration[7.0]
  def change
    remove_column :listings, :listings, :string
  end
end
