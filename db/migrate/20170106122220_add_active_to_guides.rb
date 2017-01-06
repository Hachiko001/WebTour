class AddActiveToGuides < ActiveRecord::Migration[5.0]
  def change
    add_column :guides, :active, :boolean
  end
end
