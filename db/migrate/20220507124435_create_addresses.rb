class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :address_first
      t.string :address_second
      t.string :city
      t.string :postcode
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
