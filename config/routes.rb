Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'customers' => 'customers#create'
      put 'customers/update' => 'customers#update'
      get 'customers' => 'customers#index'
      get 'customer/:customer_id' => 'customers#show'

      post 'transactions' => 'transactions#create'
      put 'transactions/update' => 'transactions#update'
      get 'transactions' => 'transactions#index'
      get 'transaction/:id' => 'transactions#show'
      get 'transaction/:customer_id' => 'transactions#cust_transactions'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
