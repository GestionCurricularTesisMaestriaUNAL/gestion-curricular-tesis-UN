Rails.application.routes.draw do

  
  devise_for :users
  get 'administrator/home'

  get 'students/index'
  get 'directors/index'
  get 'directors/home'
  get 'jurys/index'
  get 'jurys/home'

  resources :role_users
  resources :file_gradeworks
  resources :feedbacks
  resources :user_roles
  resources :gradework_users
  resources :roles
  resources :users
  resources :gradeworks

  get 'contact_us/index'
  get 'home/index'
  root 'administrator#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
