class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.integer :menu_page_id
      t.float :price
      t.float :high_price
      t.integer :dish_id
      t.datetime :created_at
      t.datetime :updated_at
      t.float :xpos
      t.float :ypos

      t.timestamps
    end
  end
end
