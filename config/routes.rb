Rails.application.routes.draw do
  root 'homes#index'

  devise_for :users, :controllers => {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    post 'users/admin_guest_sign_in', to: 'users/sessions#new_admin_guest'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end


  resources :photos do
    resource :like
    resources :comments
  end

  resources :users , only: [:show] do
    resource :follow
    resources :followings
    resources :followers
    resources :likes
  end
end
