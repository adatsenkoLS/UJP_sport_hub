class AddSubcategoryToTeams < ActiveRecord::Migration[6.1]
  def change
    add_reference :teams, :subcategory, null: false, foreign_key: true
  end
end
