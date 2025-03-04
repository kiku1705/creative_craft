class CreateProduct < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title
      t.references :category, null: false, foreign_key: true
      t.string :description
      t.integer :price, null: false
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
