Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      resources :items, only: [:index, :show]

      resources :merchants, only: [:index, :show] do 
        resources :items, controller: 'merchant_items', only: [:index] do

        end 
      end


    end 
  end 
end
