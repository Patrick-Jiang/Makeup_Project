# frozen_string_literal: true

class TagsController < ApplicationController
  include Pagy::Backend
  def index
    @tags = Tag.all.page(params[:page])
  end

  def show
    @tag = Tag.find(params[:id])
  end
end
