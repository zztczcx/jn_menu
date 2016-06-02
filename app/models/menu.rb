class Menu < ActiveRecord::Base
  has_many :menu_pages
  has_many :menu_items, through: :menu_pages 
  has_many :dishes, through: :menu_items 


  def self.clean_data(origin)
    data=origin.compact
    Rails.logger.debug "#{data.inspect}"
    
    if data.key?("date") 
      data["date"] = DateTime.strptime(data['date'], '%Y-%m-%d')
    end
    if data.key?("page_count")
      data["page_count"] = data["page_count"].to_i
    end
    
    if data.key?("dish_count")
      data["dish_count"] = data["dish_count"].to_i
    end

    data
  end
end
