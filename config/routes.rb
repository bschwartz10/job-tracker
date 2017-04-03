Rails.application.routes.draw do
  root to: 'companies#index'
  resources :companies do
    resources :contacts
    resources :jobs do
      resources :comments, only: [:create]
    end
  end
  get '/jobs', to: 'jobs#sort'
  get '/dashboard', to: 'jobs#dashboard'
  resources :categories
end
