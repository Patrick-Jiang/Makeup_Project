# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @categories = Category.all.page(params[:page])
  end

  def show
    @category = Category.find(params[:id])

    # @category = Kaminari.paginate_array([@category], total_count: @category.size).page(params[:page])
    # @pagy, @category = pagy(@category)
  end
end
