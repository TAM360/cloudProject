class RemoveRatingsFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :ratings, :integer
  end
end
