Rails.application.routes.draw do
  devise_for :users
  #ルーティング先の指定
  root to: "items#index"            #トップ画面がindexアクション
  resources :items do
    resources :orders, only: [:index, :create]
  end

  resources :users
  end
