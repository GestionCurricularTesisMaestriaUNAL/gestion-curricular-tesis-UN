Rails.application.routes.draw do

  
  get 'students/index'

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
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
