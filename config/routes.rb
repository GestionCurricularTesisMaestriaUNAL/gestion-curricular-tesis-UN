Rails.application.routes.draw do

  
  devise_for :users

  get 'administrator/home' => 'home#home'
  get 'students/index' => 'home#home'
  get 'directors/index' => 'home#home'
  get 'directors/home' => 'home#home'
  get 'jurys/index' => 'home#home'
  get 'jurys/home' => 'home#home'

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
  #root 'administrator#home'
  root 'home#home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
