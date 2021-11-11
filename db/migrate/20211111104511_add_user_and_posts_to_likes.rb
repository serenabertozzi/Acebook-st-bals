class AddUserAndPostsToLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :post_id, :integer
    add_index  :likes, :post_id

    add_column :likes, :user_id, :integer
    add_index  :likes, :user_id
  end
end
