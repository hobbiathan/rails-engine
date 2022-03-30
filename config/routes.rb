Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do 
        resources :items, only: [:index] do
          
        end 
      end
    end 
  end 
end
