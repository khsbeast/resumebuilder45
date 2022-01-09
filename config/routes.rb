Rails.application.routes.draw do
  root   'home#index'
  get    'edit'    => 'home#edit'
  get    'signup'  => 'users#new'
  post   'signup'  => 'users#create'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :profiles , only: [:update,:show]   #Profile routes to display and update
  resources :educations , only: [:new]          
  resources :experiences , only: [:new]         #Create new experience entry api route
  resources :projects , only: [:new]            #Create new project entry api route
 
end
