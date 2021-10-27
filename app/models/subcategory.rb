class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :teams 


  def sub_category
    category = self.category.name
    return category 
  end


 

end
