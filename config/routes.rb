Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      get '/merchants/find', to: 'search#find'

      resources :items do
        resources :merchant, controller: 'item_merchants', only: [:index] do

        end
      end 

      resources :merchants, only: [:index, :show] do 
        resources :items, controller: 'merchant_items', only: [:index] do

        end 
      end

    end 
  end 
end
