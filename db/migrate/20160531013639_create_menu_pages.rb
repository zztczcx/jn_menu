class CreateMenuPages < ActiveRecord::Migration
  def change
    create_table :menu_pages do |t|
      t.integer :menu_id
      t.integer :page_number
      t.integer :image_id
      t.integer :full_height
      t.integer :full_width
      t.string :uuid

      t.timestamps
    end
  end
end
