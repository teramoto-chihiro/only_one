Rails.application.routes.draw do
  root 'homes#index'

  devise_for :users

  resources :photos do
    resources :comments
  end

  resources :users do
    resource :follow
    resources :followings
    resources :followers
  end
end
