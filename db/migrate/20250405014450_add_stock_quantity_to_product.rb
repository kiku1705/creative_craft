class AddStockQuantityToProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :stock_quantity, :integer, default: 0
  end
end
