class CreatePostRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :post_ratings do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :rating

      t.timestamps
    end
  end
end
