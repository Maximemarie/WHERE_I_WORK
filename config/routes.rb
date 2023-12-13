Rails.application.routes.draw do
  devise_for :users
  root to: "places#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "profile", to: "pages#profile"

  resources :places, only: [:index, :show] do
    resources :bookings, only: [:new, :create, :destroy]
    resource :favorites, only: [:create]
    resource :reviews, only: [:create, :new]
  end

  resources :bookings, only: [:index, :update, :show]

  resources :reviews, only: [:index, :destroy]

  resources :favorites, only: [:index, :destroy]

end
