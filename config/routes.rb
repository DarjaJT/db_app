Rails.application.routes.draw do
  # get 'groups/new'
  # get 'groups/index'

  resources :users
  resources :sessions, only: [:new, :create, :destroy] # sessions_path


  root  'static_pages#home'
  match '/test',    to: 'static_pages#test',    via: 'get'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'



  get '/halls', to: 'halls#index', as: :halls_all
  post '/add_hall', to: 'halls#create', as: :halls
  get '/add_hall', to: 'halls#new', as: :add_hall
  delete '/halls/:id', to: 'halls#destroy', as: :hall
  get '/halls/:id', to: 'halls#destroy', as: :hall_delete

  get '/groups', to: 'groups#index', as: :groups_all
  post '/add_group', to: 'groups#create', as: :groups
  get '/add_group', to: 'groups#new', as: :add_group
  delete '/groups/:id', to: 'groups#destroy', as: :group
  get '/groups/:id', to: 'groups#destroy', as: :group_delete


end
