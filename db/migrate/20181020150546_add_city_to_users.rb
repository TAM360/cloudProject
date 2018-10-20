class AddCityToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :age, :integer
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :phone_number, :string
  end
end
