require 'sidekiq/web'

Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  mount Sidekiq::Web => "/sidekiq"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :logs, only: :index
  get 'streaming', to: 'logs#streaming'
end
