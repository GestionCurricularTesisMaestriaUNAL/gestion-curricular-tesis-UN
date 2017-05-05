Rails.application.routes.draw do


  resources :create_reminders
  resources :mail_templates
  resources :show_mail

  get 'mail_templates/index'
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
  resources :roles
  resources :users
  resources :gradeworks
  resources :charts

  post 'uploadfiles'=>'gradeworks#upload'
  get 'downloadfiles'=>'gradeworks#download'

  get 'contact_us/index'
  get 'home/index'
  get 'charts/index'
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
