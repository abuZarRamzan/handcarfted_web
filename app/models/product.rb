class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  acts_as_taggable_on :categories
end
