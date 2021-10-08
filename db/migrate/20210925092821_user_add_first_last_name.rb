class UserAddFirstLastName < ActiveRecord::Migration[6.1]
  def change
    reversible do |r|
      r.up do
        add_column :users, :first_name, :string
        add_column :users, :last_name, :string
        ::User.all.each do |u|
          u.update!(first_name: u.name.split(" ").first, last_name: u.name.split(" ").last)
        end
        remove_column :users, :name, :string
      end

      r.down do
        add_column :users, :name, :string
        ::User.all.each do |u|
          u.update!(name: [u.first_name, u.last_name].join(' '))
        end
        remove_column :users, :first_name, :string
        remove_column :users, :last_name, :string
      end
    end
  end
end
