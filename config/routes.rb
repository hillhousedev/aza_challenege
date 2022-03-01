Rails.application.routes.draw do
  namespace   :api, defaults: { format: :json } do
     namespace   :v1 do
        resources :customers, only: [:show, :create]
        resources :fx_transactions, only: [:show, :create, :index,]
     end 

  end 
end
