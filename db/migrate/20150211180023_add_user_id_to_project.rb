class AddUserIdToProject < ActiveRecord::Migration
  def change
    add_column :projects, :user_id, :integer, null: false
  end
end
