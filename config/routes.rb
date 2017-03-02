Rails.application.routes.draw do
  resources :rooms
  root 'rooms#index'
  resources :messages, only: [:create, :destroy]
  devise_for :users, :controllers => {:registrations => "users/registrations"}
end
