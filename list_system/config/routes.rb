Rails.application.routes.draw do

  resources :tenants, only: [:create, :destroy]
  resources :apps
  resources :lists
  resources :items
  resources :media
  resources :layouts
end
