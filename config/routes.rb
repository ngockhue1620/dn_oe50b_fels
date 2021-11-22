Rails.application.routes.draw do
  root "home#index"
  resources :users_courses
  resources :lessions_courses
  resources :answers
  resources :questions
  resources :tasks
  resources :lessions
  resources :courses
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
