Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  
  # sintaxis de una ruta
  # metodo_http "url", to: "controlador#accion"
  
    resources :products
    
  #CRUD
  # get "/products", to: "products#index"
  # post "/products", to: "products#create"
  # delete "/products/:id", to: "products#destroy"
  # get "/products/new", to: "products#new"
  # patch "/products/:id", to: "products#update"
  # get "/products/:id", to: "products#show"
  # get "/products/:id/edit", to: "products#edit" 
end
