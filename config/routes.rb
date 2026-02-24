Rails.application.routes.draw do
  resources :user_skills
  root to: "pages#home"
  get "pages/home"
  get "/dashboard", to: "dashboard#index"

  resources :user_projects
  resources :projects
  resources :skills
  devise_for :users
end
