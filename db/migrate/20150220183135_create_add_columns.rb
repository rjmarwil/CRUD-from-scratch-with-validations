class CreateAddColumns < ActiveRecord::Migration
  def change
    add_column :statuses, :user, :string
    add_column :statuses, :likes, :integer
  end
end
