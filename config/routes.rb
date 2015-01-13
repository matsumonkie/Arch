Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root 'welcome#index'

  resources :specs, only: [:index]
  resources :translations, only: [:show]
  resources :users, only: [:index, :show, :edit, :update] do
    get 'current', on: :collection
  end

  get 'templates/*id', to: 'templates#show'
  put 'demo_users', to: 'demo_users#update'
end
