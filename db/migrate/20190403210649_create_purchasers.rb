class CreatePurchasers < ActiveRecord::Migration[5.2]
  def change
    create_table :purchasers do |t|
      t.string :name, index: true
      t.timestamps
    end
  end
end
