class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :message
      t.integer :likes_count
      t.string :image_url

      t.timestamps
    end
  end
end
