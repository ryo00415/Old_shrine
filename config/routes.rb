Rails.application.routes.draw do
  # 管理者用ルート
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  get 'admin/index', to: 'admins#index', as: 'admin_index'

  # ユーザー関連のルート
  scope module: :public do
    root to: 'homes#top'
    resources :users, only: [:show, :edit, :update, :confirm_withdraw, :withdraw] do
      resources :goods, only: [:index, :create, :destroy]
    end
    resources :photos, only: [:index, :new, :create, :show, :destroy] do
      member do
        post 'good', to: 'goods#create', as: 'good_photo'
        delete 'nogood', to: 'goods#destroy', as: 'nogood_photo'
      end
    end
    resources :comments, only: [:create, :destroy]
    resources :timelines, only: [:index]
    get '/search', to: 'search#search', as: 'search'
  end

  # ユーザー用ルート
  devise_for :users, skip: [:passwords], path: '', path_names: { sign_in: 'login', sign_up: 'register' }, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  get 'users/withdraw', to: 'users#confirm_withdraw', as: :withdraw_user
  delete 'users/withdraw', to: 'users#withdraw', as: :delete_user

  # 写真削除ルート
  delete '/photos/:id', to: 'photos#destroy', as: 'delete_photo'

end
