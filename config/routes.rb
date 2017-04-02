Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show, :edit, :update]
  get '/profile', to: 'users#index'
  get '/profile/edit', to: 'users#edit'

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :budget

  root 'posts#index'

end
