Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :orders, param: :team_id do
        member do
          get :have_team_all
          get :create_order
        end
      end
      get '/orders/create/:id' => "orders#create"
      resources :users
      # 継承しているdeviseコントローラーを編集したいときにこういう記述をする
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations'
      }

      namespace :auth do
        resources :sessions, only: %i[index]
      end
    end
  end
end