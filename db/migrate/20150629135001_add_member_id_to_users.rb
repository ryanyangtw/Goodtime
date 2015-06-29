class AddMemberIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :member_id_year, :string
    add_column :users, :member_id_month, :string
    add_column :users, :member_id_number, :integer
  end
end
