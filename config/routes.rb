Rails.application.routes.draw do
  

  get 'show_mails/index'

  resources :create_reminders
  resources :mail_templates
  resources :show_mail

  get 'mail_templates/index'
  get 'administrator/home'
  get 'reminders/index'

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
  resources :roles
  resources :users
  resources :gradeworks
  resources :charts

  post 'uploadfiles'=>'gradeworks#upload'
  get 'downloadfiles'=>'gradeworks#download'

  get 'contact_us/index'
  get 'home/index'
  #root 'administrator#home'
  get 'charts/index'
  root 'home#home'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
