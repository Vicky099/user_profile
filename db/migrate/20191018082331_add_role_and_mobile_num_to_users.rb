class AddRoleAndMobileNumToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role, :string
    add_column :users, :mobile_number, :string
  end
end
