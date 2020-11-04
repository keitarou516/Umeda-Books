Rails.application.routes.draw do
  root "books#index"
  resources :books, except: [:edit, :update, :destroy] do
    resources :reviews, only: [:index, :new, :create, :destroy]
    resources :rentals, only: [:new, :create, :destroy]
  end
end