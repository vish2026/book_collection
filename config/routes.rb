Rails.application.routes.draw do
  resources :books
  resources :users
  resources :user_books

  root "user_books#index"
end
