class AddCategoryToSubcategory < ActiveRecord::Migration[6.1]
  def change
    add_reference :subcategories, :category, null: false, foreign_key: true
  end
end
