Rails.application.routes.draw do
  get '/api/v1/merchants/:id/revenue', to: "api/v1/merchants/revenue#show"

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        collection do
          get 'find', to: 'merchants/find#show'
          get 'find_all', to: 'merchants/find#index'
        end
        member do
          get 'items', to: 'merchants/items#index'
          get 'invoices', to: 'merchants/invoices#index'
          get 'favorite_customer', to: 'merchants/favorite_customer#show'
          get 'customers_with_pending_invoices', to: 'merchants/customers_with_pending_invoices#index'
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
        member do
          get 'favorite_merchant', to: 'customers/favorite_merchant#show'
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
        member do
          get 'invoice_items', to: 'items/invoice_items#index'
          get 'merchant', to: 'items/merchant#index'
        end
      end
      resources :invoice_items, only: [:index, :show] do
        collection do
          get 'find', to: 'invoice_items/find#show'
          get 'find_all', to: 'invoice_items/find#index'
        end
        member do
          get 'invoice', to: 'invoice_items/invoice#index'
          get 'item', to: 'invoice_items/item#index'
        end
      end
    end
  end
end
