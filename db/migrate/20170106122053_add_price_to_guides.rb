class AddPriceToGuides < ActiveRecord::Migration[5.0]
  def change
    add_column :guides, :price, :decimal, precision: 12, scale: 3
  end
end
