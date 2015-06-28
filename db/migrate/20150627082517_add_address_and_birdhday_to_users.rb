class AddAddressAndBirdhdayToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address_country, :string
    add_column :users, :address_district, :string
    add_column :users, :birthday_year, :string
    add_column :users, :birthday_month, :string
    add_column :users, :birthday_date, :string
    add_column :users, :phone_number, :string
  end
end
