class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.string :city_name, null: false, default: ''
      t.belongs_to :country,  foreign_key: {on_delete: :cascade }
      t.timestamps
    end
  end
end
