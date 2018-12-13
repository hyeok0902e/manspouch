class AddUserIdToContent < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :user_id, :integer
    add_index :contents, :user_id
  end
end
