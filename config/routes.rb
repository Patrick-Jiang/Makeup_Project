# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'tags/index'
  # get 'tags/show'
  # get 'products/index'
  # get 'products/show'
  # get 'brands/index'
  # get 'brands/show'
  # get 'categories/index'
  # get 'categories/show'
  root to: 'products#index'

  get 'categories', to: 'categories#index', as: 'categories'
  get 'categories/:id', to: 'categories#show', id: /\d+/, as: 'category'
  # resource 'products', only: %i[index show]
  get 'products', to: 'products#index', as: 'products'
  get 'products/:id', to: 'products#show', id: /\d+/, as: 'product'

  get 'brands', to: 'brands#index', as: 'brands'
  get 'brands/:id', to: 'brands#show', id: /\d+/, as: 'brand'

  get 'tags', to: 'tags#index', as: 'tags'
  get 'tags/:id', to: 'tags#show', id: /\d+/, as: 'tag'
  # For details on the DSL available within this file, see https:/ / guides.rubyonrails.org / routing.html
end
