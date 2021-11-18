class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :message
      t.string :image_url

      t.timestamps
    end
  end
end
