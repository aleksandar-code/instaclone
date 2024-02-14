class AddLikesToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :likes, :string
  end
end
