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
  resources :timelines
  get 'users/new'
  post 'users' => 'users#create'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  root to: "homes#top"
  resources :photos do
  member do
    post 'like', to: 'likes#create'
    delete 'unlike', to: 'likes#destroy'
  end
  end
end
