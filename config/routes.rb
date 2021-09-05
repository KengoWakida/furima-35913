Rails.application.routes.draw do
  devise_for :users
  #ルーティング先の指定
  root to: "items#index"            #トップ画面がindexアクション
  resources :items
  resources :users
  end
