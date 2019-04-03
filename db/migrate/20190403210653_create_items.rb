class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :description, index: true
      t.decimal :price, precision: 9, scale: 2
    end
  end
end
