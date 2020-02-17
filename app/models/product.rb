class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category
  has_many :product_tags
  has_may :tags, through: :product_tags
end
