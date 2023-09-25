Rails.application.routes.draw do
  # 管理者用ルート
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  get 'admin/index', to: 'admins#index', as: 'admin_index'

  # ユーザー関連のルート
  scope module: :public do
    root to: 'homes#top'
    resources :users, only: [:show, :edit, :update] do
      member do
        get 'confirm_withdraw', to: 'users#confirm_withdraw', as: 'confirm_withdraw'
        delete 'withdraw', to: 'users#withdraw', as: 'withdraw'
      end
      resources :goods, only: [:index, :create, :destroy]
      resources :photos do
        resources :comments, only: [:create, :destroy]
        member do
          post 'good', to: 'goods#create', as: 'good_photo'
          delete 'good', to: 'goods#destroy', as: 'nogood_photo'
        end
      end
    end
    resources :timelines, only: [:index]
    get '/search', to: 'search#search', as: 'search'
  end

  # ユーザー用ルート
  devise_for :users, skip: [:passwords], path: '', path_names: { sign_in: 'login', sign_up: 'register' }, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
end

