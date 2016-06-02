class Dish < ActiveRecord::Base
  has_one :menu_item

  def self.clean_data(origin)
    origin = origin.compact
    if origin['id'] then  origin['id'] = origin['id'].to_i end

    if origin['menus_appeared'] then origin['menus_appeared'] = origin['menus_appeared'].to_i end

    if origin['times_appeared'] then origin['times_appeared'] = origin['times_appeared'].to_i end

    if origin['first_appeared'] then origin['first_appeared'] = origin['first_appeared'].to_i end

    if origin['last_appeared'] then origin['last_appeared'] = origin['last_appeared'].to_i end

    if origin['lowest_price'] then origin['lowest_price'] = origin['lowest_price'].to_f end

    if origin['highest_price'] then origin['highest_price'] = origin['highest_price'].to_f end

    origin
  end
end
