class RenameInvoiceitemsTableToInvoiceItems < ActiveRecord::Migration[5.0]
  def change
    rename_table :invoiceitems, :invoice_items
  end
end
