class CreateShipments < ActiveRecord::Migration[7.0]
  def change
    create_table :shipments do |t|
      t.references :listing, null: false, foreign_key: true
      t.date :date_shipped
      t.references :buying_user, null: false, foreign_key: { to_table: :users }
      t.references :selling_user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
