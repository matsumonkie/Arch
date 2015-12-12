Rails.application.routes.draw do
  root 'api/users#index'

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
    resources :users do
      collection do
        get 'index'
        get 'update_email'
      end
    end
  end
end
