Rails.application.routes.draw do
  
  root 'welcome#index' # root path
  
  # Authentication routes 
  get 'signup', to: 'users#new' #signup path /signup
  get 'login', to: 'sessions#new' # login path /login
  post 'login', to: 'sessions#create' # post login path
  delete 'logout', to: 'sessions#destroy' # loghout path /logout
  
  # Resources
  resources :users, except: [:new]
  
end
