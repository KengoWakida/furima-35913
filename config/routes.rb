Rails.application.routes.draw do
  #ルーティング先の指定
  root to: "items#index"            #トップ画面がindexアクション
  #get "items", to: 'items#index'
  resources :items
  end
