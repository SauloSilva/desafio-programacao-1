class CreateImporters < ActiveRecord::Migration[5.2]
  def change
    create_table :importers do |t|
      t.string :file
      t.decimal :gross_value, precision: 9, scale: 2, default: 0
      t.string :status
      t.datetime :imported_at
      t.timestamps
    end
  end
end
