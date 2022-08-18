class RenameUserId < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :user_id, :authorid
    rename_column :likes, :user_id, :authorid
    rename_column :posts, :user_id, :authorid
  end
end
