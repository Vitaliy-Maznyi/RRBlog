Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'persons/profile'

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :budget

  root 'posts#index'

end
