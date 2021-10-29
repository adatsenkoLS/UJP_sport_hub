class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :team


  def sub_category
    category = self.category.name
    return category 
  end


 

end
