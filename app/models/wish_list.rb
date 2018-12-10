class WishList < ApplicationRecord
    # belongs_to :user, class_name: "user"
    validates :location_name, presence: true
end