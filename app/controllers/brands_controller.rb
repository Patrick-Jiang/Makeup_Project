# frozen_string_literal: true

class BrandsController < ApplicationController
  include Pagy::Backend
  def index
    @pagy, @brands = pagy(Brand.all, item: 9)
  end

  def show
    # @pagy, @brand = pagy(Brand.find(params[:id]), item: 9)
    @brand = Brand.find(params[:id])
  end
end
