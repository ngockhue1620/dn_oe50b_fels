Rails.application.routes.draw do
  resources :exams
  root "home#index"
  get '/login', to: "home#new"
  post '/login', to: 'home#create'
  get "/logout", to: "home#destroy"

  resources :questions
  resources :tasks
  resources :lessions
  resources :lessions_courses
  resources :courses
  resources :users
  resources :home
  resources :users_courses
  resources :exams_details
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
