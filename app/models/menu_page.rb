class MenuPage < ActiveRecord::Base
  has_many :menu_items
  has_many :dishes, through: :menu_items

  belongs_to :menu
end
