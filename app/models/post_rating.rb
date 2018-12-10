class PostRating < ApplicationRecord
    # belongs_to :post, class: 'Post'
    validates :user_id, :post_id, :rating, presence: true
end
