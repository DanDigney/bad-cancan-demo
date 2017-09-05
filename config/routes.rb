Rails.application.routes.draw do
  root "posts#index"

  resources :posts do
    resources :comments
  end

  resources :sessions

  resources :users
end
