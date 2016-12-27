class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :guide_id
      t.string :title
      t.string :content
      t.float :rating

      t.timestamps
    end
  end
end
