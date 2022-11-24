Rails.application.routes.draw do
  # devise_for :admin_users, ActiveAdmin::Devise.config
  namespace :api do
    namespace :v1 do
      resources :orders, only: %i[index create show], param: :team_id do
        collection do
          get :order_confirm
          post :submit
        end
        member do
          get :have_team_all
          get :create_order

        end
      end
      get '/orders/create/:id' => 'orders#create'
      get '/orders/show_order/:event_name/:users_id' => 'orders#show_order'
      resources :users
      # 継承しているdeviseコントローラーを編集したいときにこういう記述をする
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations'
      }

      resources :ishikawa_management, only: %i[index show]

      namespace :auth do
        resources :sessions, only: %i[index]
      end
    end
  end
end