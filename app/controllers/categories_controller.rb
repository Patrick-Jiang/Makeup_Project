# frozen_string_literal: true

class CategoriesController < ApplicationController
  include Pagy::Backend
  def index
    @pagy, @categories = pagy(Category.all)
  end

  def show
    @category = Category.find(params[:id])

    # @category = Kaminari.paginate_array([@category], total_count: @category.size).page(params[:page])
    # @pagy, @category = pagy(@category)
  end
end
