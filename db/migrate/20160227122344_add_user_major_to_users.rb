class AddUserMajorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_major, :string
    add_column :users, :student_num, :integer
  end
end
