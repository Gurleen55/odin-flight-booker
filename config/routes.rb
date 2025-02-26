Rails.application.routes.draw do
  get "bookings/new"
  get "flights/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "index", to: "flights#index", as: :flights
  get "booking", to: "bookings#new", as: :new_booking
  post "bookings", to: "bookings#create", as: :bookings
  get "bookings/:id", to: "bookings#show", as: :booking

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

   # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
   # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
   # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

   # Defines the root path route ("/")
   root "flights#index"
end
