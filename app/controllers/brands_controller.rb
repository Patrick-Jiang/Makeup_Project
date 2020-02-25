# frozen_string_literal: true

class BrandsController < ApplicationController

  def index
   @brands = Brand.all.page(params[:page])
  end

  def show
    # @pagy, @brand = pagy(Brand.find(params[:id]), item: 9)
    @brand = Brand.find(params[:id])
  end
end
