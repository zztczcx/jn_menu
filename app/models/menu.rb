class Menu < ActiveRecord::Base
  has_many :menu_pages
  has_many :menu_items, through: :menu_pages 
  has_many :dishes, through: :menu_items 
end
