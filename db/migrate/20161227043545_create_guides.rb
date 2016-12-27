class CreateGuides < ActiveRecord::Migration[5.0]
  def change
    create_table :guides do |t|
      t.string :name
      t.string :password
      t.datetime :date
      t.string :language
      t.string :address
      t.string :email
      t.string :image
      t.float :rating

      t.timestamps
    end
  end
end
