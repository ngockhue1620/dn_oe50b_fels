Rails.application.routes.draw do
  root "home#new"
  post '/login', to: 'home#create'
  delete '/logout', to: 'home#destroy'
  resources :answers
  resources :questions
  resources :tasks
  resources :lessions
  resources :courses
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
