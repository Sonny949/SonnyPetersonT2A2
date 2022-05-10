class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description
      t.float :price, null: false
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
