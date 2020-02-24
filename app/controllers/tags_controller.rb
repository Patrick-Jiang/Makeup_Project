# frozen_string_literal: true

class TagsController < ApplicationController
  include Pagy::Backend
  def index
    @pagy, @tags = pagy(Tag.all)
  end

  def show
    @tag = Tag.find(params[:id])
  end
end
