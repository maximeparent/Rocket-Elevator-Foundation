Rails.application.routes.draw do

  resources :quotes
  resources :leads
  resources :buildings
  resources :interventions
  devise_for :users, :controllers => { :registrations => "users/registrations", :sessions => "users/sessions", :passwords => 		"users/passwords" }

  # devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Blazer::Engine, at: "blazer"

  root 'pages#index'
  post '/index' => "leads#create"
  post '/quotes' => "quotes#create"
  get '/message' => "pages#message"
  get '/quotesconfirm' => "pages#quotesconfirm"
  get '/index' => "pages#index"
  get '/residential' => "pages#residential"
  get '/corporate' => "pages#corporate"
  get '/submissionform' => "quotes#submissionform"
  get '/privacy' => "pages#privacy"
  get '/404' => "pages#404"
  get '/tos' => "pages#tos"
  get '/dashboard' => "watson#create"
  post '/dashboard' => "watson#create"
  get '/useless' => "pages#useless"


  get 'dropbox/auth' => 'dropbox#auth'
  get 'dropbox/auth_callback' => 'dropbox#auth_callback'

  post '/new_intervention' => 'interventions#new_intervention'

  get 'get_courses_by_location/:location_id', to: 'courses#get_courses_by_location'  
  get '/course_search' => 'courses#course_search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
