Rails.application.routes.draw do
  get 'users/index'
  resources :questions
   #devise_for :users, controllers: {
   #    sessions: 'users/sessions'
   # }
   devise_for :users, path: 'users'
   devise_for :admins, path: 'admins'
	#devise_for :admins, controllers: {
  #     sessions: ' admins/sessions'
  #  }

  get '/poll/index', to: 'poll#index', as: 'poll'
  post 'poll/submitt'
	root  "home#index"
  patch 'questions/:id/:q_status', to: 'questions#update_status', as: 'update_status'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
