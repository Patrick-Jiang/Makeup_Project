# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'categories/index'
  # get 'categories/show'
  root to: 'categories#index'

  get 'categories/:id', to: 'categories#show', id: /\d+/, as: 'category'
  # For details on the DSL available within this file, see https:/ / guides.rubyonrails.org / routing.html
end
