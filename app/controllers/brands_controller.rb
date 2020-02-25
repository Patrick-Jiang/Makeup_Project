# frozen_string_literal: true

class BrandsController < ApplicationController
  def index
    @brands = Brand.includes(:products).all.page(params[:page])
  end

  def show
    # @pagy, @brand = pagy(Brand.find(params[:id]), item: 9)
    @brand = Brand.find(params[:id])
  end
end
