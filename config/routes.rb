Rails.application.routes.draw do
  get '/api/v1/merchants/:id/revenue', to: "api/v1/merchants/revenue#show", as: "api_v1_merchants_revenue", defaults: {format: :json}

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        collection do
          get 'find', to: 'merchants/find#show'
          get 'find_all', to: 'merchants/find#index'
        end
      end
      resources :transactions, only: [:index, :show] do
        collection do
          get 'find', to: 'transactions/find#show'
          get 'find_all', to: 'transactions/find#index'
        end
      end
      resources :customers, only: [:index, :show] do
        collection do
          get 'find', to: 'customers/find#show'
          get 'find_all', to: 'customers/find#index'
        end
      end
      resources :invoices, only: [:index, :show] do
        collection do
          get 'find', to: 'invoices/find#show'
          get 'find_all', to: 'invoices/find#index'
        end
      end
      resources :items, only: [:index, :show] do
        collection do
          get 'find', to: 'items/find#show'
          get 'find_all', to: 'items/find#index'
        end
      end
      resources :invoice_items, only: [:index, :show] do
        collection do
          get 'find', to: 'invoice_items/find#show'
          get 'find_all', to: 'invoice_items/find#index'
        end
      end
    end
  end
end
