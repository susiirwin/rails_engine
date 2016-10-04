Rails.application.routes.draw do
  get "api/v1/merchants/find", to: "api/v1/merchants/find#show"
  get "api/v1/merchants/find_all", to: "api/v1/merchants/find#index"
  get "api/v1/transactions/find", to: "api/v1/transactions/find#show"
  get "api/v1/transactions/find_all", to: "api/v1/transactions/find#index"
  # get "api/v1/items", to: "api/v1/items#index"
  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
  end
end
