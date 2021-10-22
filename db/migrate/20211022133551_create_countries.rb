class CreateCountries < ActiveRecord::Migration[6.1]
  def change
    create_table :countries do |t|
      t.string :coutry_name ,null: false, default: ''
     
      t.timestamps
    end
  end
end
