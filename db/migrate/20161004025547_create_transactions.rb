class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.text :credit_card_number
      t.text :result

      t.timestamps
    end
  end
end
