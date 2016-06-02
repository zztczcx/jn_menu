class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.string :sponsor
      t.string :event
      t.string :venue
      t.string :place
      t.text :physical_description
      t.string :occasion
      t.text :notes
      t.string :call_number
      t.string :keywords
      t.string :language
      t.datetime :date
      t.string :location
      t.string :location_type
      t.string :currency
      t.string :currency_symbol
      t.string :status
      t.integer :page_count
      t.integer :dish_count

      t.timestamps
    end
  end
end
