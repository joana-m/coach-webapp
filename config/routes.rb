Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :coachsessions do
    resources :bookings, only: [:index, :create]
    resources :reviews, only: :create
  end
  resources :bookings, only: [:destroy, :index, :create]
end
