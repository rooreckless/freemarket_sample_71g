Rails.application.routes.draw do
  devise_for :users
  root "deploytest#index"
  #上の記述はデプロイができている確認用のビューを表示するためのものです。確認出来次第削除願います。
  #また、デプロイが確認されたあとは、deploytestコントローラと、views内のdeploytestディレクトリも削除願います。
  resources :products, only: [:new, :show, :create, :index]
end
