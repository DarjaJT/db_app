Rails.application.routes.draw do

  # get 'hall_groups/new'
  # get 'hall_groups/index'

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

  get '/hall_groups', to: 'hall_groups#index', as: :hall_groups_all
  post '/add_hall_groups', to: 'hall_groups#create', as: :hall_groups
  get '/add_hall_groups', to: 'hall_groups#new', as: :add_hall_group
  delete '/hall_groups/:id', to: 'hall_groups#destroy', as: :hall_group
  get '/hall_groups/:id', to: 'hall_groups#destroy', as: :hall_group_delete

  get '/trainer_form', to: 'users#trainer_add', as: :trainer_add


end
