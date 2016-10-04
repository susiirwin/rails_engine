class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'citext'
    
    create_table :invoices do |t|
      t.citext :status

      t.timestamps
    end
  end
end
