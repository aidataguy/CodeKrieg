Rails.application.routes.draw do
  
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  # Paths
  root 'welcome#index' # root path
  
  # Authentication routes 
  get 'signup', to: 'users#new' #signup path /signup
  get 'login', to: 'sessions#new' # login path /login
  post 'login', to: 'sessions#create' # post login path
  delete 'logout', to: 'sessions#destroy' # loghout path /logout
  
  # Page routes
  get 'company', to: 'pages#company'
  get 'services', to: 'pages#services'
  get 'quote_request', to: 'pages#quote_request'
  
  # Legal routes
  get 'tos', to: 'pages#tos'
  get 'privacy', to: 'pages#privacy'
  
  # Resources
  resources :projects
  resources :articles 
  resources :users, except: [:new]
  resources :comments, only: [:create, :destroy]
  resources :categories, except: [:destroy]
  resources :quotes, only: [:new, :create]
  
end
