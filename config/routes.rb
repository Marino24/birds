Rails.application.routes.draw do

  root to: "main#index"

  post 'change_background', to: 'main#change_background'

  get "galerija", to: "galerija#galerijaIndex"

  get "registracija", to: "registracija#new"
  post "registracija", to: "registracija#create"

  get "prijava", to: "session#new"
  post "prijava", to: "session#create"

  delete "odjava", to: "session#destroy"

  get "nalozi", to: "galerija#new"
  post "nalozi", to: "galerija#create"

  get "posta", to: "mail#new"
  post "posta", to: "mail#send"

  resources :notepads



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
