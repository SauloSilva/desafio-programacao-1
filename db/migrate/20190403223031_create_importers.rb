class CreateImporters < ActiveRecord::Migration[5.2]
  def change
    create_table :importers do |t|
      t.string :file
    end
  end
end
