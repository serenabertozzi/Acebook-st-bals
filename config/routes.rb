Rails.application.routes.draw do
  get 'sign_up', to: "registrations#new"
  post 'sign_up', to: "registrations#create"
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "posts#index"
end
