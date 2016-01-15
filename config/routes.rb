Rails.application.routes.draw do
  root 'api/users#index'

  if Rails.env.development?
    match "/as/:type/*route" => "easy_query#as", via: [:get, :post, :put, :patch, :destroy, :option]
  end

  namespace :api, only: [] do
    resources :users do
      collection do
        get 'index'
        put 'update_email'
      end
    end
  end
end
