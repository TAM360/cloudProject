class Post < ApplicationRecord
  validates :description, :diary_type, :location, :user_id, presence: true
  # ---- below validations require "active_storage_validations" gem
  # ---- link ==> https://github.com/igorkasyanchuk/active_storage_validations
  # validates :picture, presence: true, content_type: ['image']
  enum diary_type: ['Within City', 'Out of City', 'Out of Country']

  has_many_attached :pictures
end
