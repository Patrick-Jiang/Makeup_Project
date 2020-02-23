# frozen_string_literal: true

class ProductsController < ApplicationController
  include Pagy::Backend
  def index
    @pagy, @products = pagy(Product.all)
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @products = Product.where('name LIKE ? AND category_id = ?',
                              "%#{params[:search_term]}%",
                              params[:category_id].to_s)
  end
end
