class Dish < ActiveRecord::Base
  has_one :menu_item
end
