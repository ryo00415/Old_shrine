Rails.application.routes.draw do
  # 管理者用ルート
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  get 'admin/index', to: 'admins#index', as: 'admin_index'

  # ユーザー用ルート
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }
  get 'users/withdraw', to: 'user/users#confirm_withdraw', as: :withdraw_user
  delete 'users', to: 'user/users#withdraw', as: :delete_user

  # ユーザー関連のルート
  resources :users do
    resources :goods, only: [:index]
    member do
      get 'confirm_withdraw', as: 'confirm_withdraw_user'
      delete 'withdraw', as: 'delete_user'
    end
  end

  # 検索ルート
  get '/search', to: 'search#search', as: 'search'

  # タイムラインルート
  resources :timelines

  # 写真ルート
  resources :photos, as: 'user_photos' do
    member do
      post 'good', to: 'goods#create', as: 'good_photo'
      delete 'nogood', to: 'goods#destroy', as: 'nogood_photo'
    end
    resources :comments, only: [:create, :destroy]
  end

  # 写真削除ルート
  delete '/photos/:id', to: 'photos#destroy', as: 'delete_photo'

  # ルート
  root to: 'homes#top'
end