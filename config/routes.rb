Rails.application.routes.draw do
  get 'sign-up', to: "registrations#new"
  post 'sign-up', to: "registrations#create"
  get 'sign-in', to: "sessions#new"
  post 'sign-in', to: "sessions#create"
  delete 'log-out', to: "sessions#destroy"

  resources :comments
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "posts#index"
end
