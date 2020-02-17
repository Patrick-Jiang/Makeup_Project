# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :product_tags
  has_may :products, through: :product_tags
end
