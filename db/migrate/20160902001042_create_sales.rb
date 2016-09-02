class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.string :buyer_name
      t.text :description
      t.decimal :unit_price, :precision => 8, :scale => 2
      t.integer :amount
      t.string :full_address
      t.string :provider_name

      t.timestamps
    end
  end
end
