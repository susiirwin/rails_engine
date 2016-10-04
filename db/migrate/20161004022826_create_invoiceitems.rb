class CreateInvoiceitems < ActiveRecord::Migration[5.0]
  def change
    create_table :invoiceitems do |t|
      t.integer :quantity
      t.integer :unit_price

      t.timestamps
    end
  end
end
