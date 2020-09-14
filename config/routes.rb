Rails.application.routes.draw do
  get 'approvals/new'

  root 'static_pages#top' 
  get '/signup', to: 'users#new'
  post 'approvals/user_approvals'

 # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
      get :search, on: :collection
    member do 
      get 'edit_basic_info'
      patch 'update_basic_info'
      get 'attendances/edit_one_month'
      patch 'attendances/update_one_month' # この行が追加対象です。
      get 'cvertime_application'
    end
    resources :attendances, only: :update
  end
end