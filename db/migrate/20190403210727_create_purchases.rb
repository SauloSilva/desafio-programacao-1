class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.references :merchant, index: true
      t.references :item, index: true
      t.references :purchaser, index: true
      t.references :importer, index: true
      t.integer :quantity
    end

    add_index :purchases, [:merchant_id, :item_id, :purchaser_id, :importer_id], name: 'index_purchases_on_reference_ids'
  end
end
