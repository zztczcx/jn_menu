class MenuItem < ActiveRecord::Base
  belongs_to :menu_page
  belongs_to :dish
end
