class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :description
      t.integer :menus_appeared
      t.integer :times_appeared
      t.integer :first_appeared
      t.string :last_appeared
      t.string :integer
      t.float :lowest_price
      t.float :highest_price

      t.timestamps
    end
  end
end
