Rails.application.routes.draw do
#管理者用
# URL /admin/sign_in ...
  devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  get 'admin/index'

# 顧客用
# URL /customers/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}
  get '/search', to: 'search#search', as: 'search'
  resources :timelines
  resources :users, only: [:new, :create, :index, :show, :edit]
  root to: 'homes#top'
  resources :photos do
  member do
    post 'like', to: 'likes#create'
    delete 'unlike', to: 'likes#destroy'
  end
  resources :comments, only: [:create, :destroy]
  end
end
