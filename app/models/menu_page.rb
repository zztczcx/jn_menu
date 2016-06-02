class MenuPage < ActiveRecord::Base
  has_many :menu_items
  has_many :dishes, through: :menu_items

  belongs_to :menu

  def self.clean_data(origin)
    origin.each do |k, v|
      if k != 'uuid' 
        origin[k] = v.to_i
      end
    end
  end
end
