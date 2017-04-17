Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users, controllers: { registrations: 'registrations' }

  namespace :admin do
    resources :users, only: [:index, :edit, :update]
  end

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :budget

  resources :users, only: [:show, :edit, :update]
  get '/profile', to: 'users#index'
  get '/profile/edit', to: 'users#edit'
end
