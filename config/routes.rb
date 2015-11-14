Rails.application.routes.draw do
  root 'static_pages#index'
  get 's/:page', to: 'static_pages#show', as: :show_static
 
  if Rails.env.development?
    match "/as/:type/*route" => "easy_query#as", via: [:get, :post, :put, :patch, :destroy, :option]
  end

  resources :accounts, only: [] do
    collection do
      get 'confirm'
      put 'activate'
      put 'reset_password'
    end
  end

  namespace :api do
    resources :users, only: [:index]      
    end
  end
end
