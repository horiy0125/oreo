Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
  end

  namespace :api do
    get '/health_check' => 'health_check#index'

    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'

      get '/callback' => 'callback#index'

      get '/balance' => 'balance#index'
      resources :monthly_balances, only: [:create, :update, :destroy]
      resources :receipts, only: [:create, :update, :destroy]
      resources :expenses, only: [:create, :update, :destroy]
    end
  end

end
