class Create < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      t.text :first_column, null: false, default: 'val'
      t.integer :second_column, null: true
      t.references :table_2, delete: :cascade
    end
  end
end
