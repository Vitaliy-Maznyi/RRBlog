Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: :show
  get '/profile', to: 'users#index'

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :budget

  root 'posts#index'

end
