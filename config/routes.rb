Rails.application.routes.draw do
  get 'user/show'
  post 'user/update'
  mount_devise_token_auth_for 'User', at: 'api/auth', skip: [:omniauth_callbacks]

  namespace :api do
    resources :foodbags, only: [:index, :show, :create]
    resources :user, only: [:show, :update, :index]
  end
end
