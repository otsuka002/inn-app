Rails.application.routes.draw do
  get 'reservations/index'
  get 'reservations/new'
  get 'rooms/index'
  get 'rooms/show'
  get 'rooms/new'
  get 'rooms/edit'
  devise_for :users
  root to: "home#index"
  resources :users
  resources :rooms
  resources :reservations
end
