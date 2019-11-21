Rails.application.routes.draw do

  resources :tenants, only: [:create]
  resources :apps
  resources :lists
  resources :items
  resources :media
  resources :layouts
end
