Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "divisas" => "divisas#get_divisas", as: :get_divisas
  get "latest" => "divisas#get_latest", as: :get_latest
  get "request_data" => "divisas#request_data",as: :request_data
  # Defines the root path route ("/")
  root "main#home"
end
