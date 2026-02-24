Rails.application.routes.draw do
  root to: "pages#home"
  
  # Dashboard routes - consolidated
  get "/dashboard", to: "dashboard#index"
  get "/dashboard/:user", to: "dashboard#index"

  # Resourceful routes
  resources :user_skills
  resources :user_projects
  resourses :users_profiles
  resources :projects
  resources :skills
  resources :profiles
  
  # Devise routes
  devise_for :users

  # Pages routes
  get "/index", to: "pages#index"

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:
  # get("/your_first_screen", { :controller => "pages", :action => "first" })
end
