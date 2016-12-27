class CreateTours < ActiveRecord::Migration[5.0]
  def change
    create_table :tours do |t|
      t.datetime :start
      t.datetime :end
      t.float :price
      t.string :location
      t.integer :user_id
      t.integer :guide_id

      t.timestamps
    end
  end
end
