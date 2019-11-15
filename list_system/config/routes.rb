Rails.application.routes.draw do
  resources :apps
  resources :lists
  resources :items
  resources :media
  resources :layouts
end
