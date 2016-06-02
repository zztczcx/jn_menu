class MenuItem < ActiveRecord::Base
  belongs_to :menu_page
  belongs_to :dish

  def self.clean_data(origin)
    origin = origin.compact
    if origin['id'] then  origin['id'] = origin['id'].to_i end
    if origin['menu_page_id'] then origin['menu_page_id'] = origin['menu_page_id'].to_i end
    if origin['price'] then origin['price'] = origin['price'].to_f end
    if origin['high_price'] then origin['high_price'] = origin['price'].to_f end

    if origin['created_at'] then origin['created_at'] = DateTime.strptime(origin['created_at'], "%Y-%m-%d %H:%M:%S") end
    if origin['updated_at'] then origin['updated_at'] = DateTime.strptime(origin['updated_at'], "%Y-%m-%d %H:%M:%S") end

    if origin['xpos'] then origin['xpos'] = origin['xpos'].to_f end
    if origin['ypos'] then origin['ypos'] = origin['ypos'].to_f end

    origin
  end
end
