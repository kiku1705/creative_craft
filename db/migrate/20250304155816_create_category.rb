class CreateCategory < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.integer :products_count, default: 0
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
