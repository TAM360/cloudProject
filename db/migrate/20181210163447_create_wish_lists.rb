class CreateWishLists < ActiveRecord::Migration[5.2]
  def change
    create_table :wish_lists do |t|
      t.integer :user_id
      t.string :location_name

      t.timestamps
    end
  end
end
