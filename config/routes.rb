Rails.application.routes.draw do
  # get 'purchase/index'
  get 'purchase/done'
  get 'card/new'
  get 'card/show'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root to: "products#index"
  #上の記述はデプロイができている確認用のビューを表示するためのものです。確認出来次第削除願います。
  #また、デプロイが確認されたあとは、deploytestコントローラと、views内のdeploytestディレクトリも削除願います。
  resources :users, only: [:show,:index]
  resources :addresses, only: [:new, :create, :index]
  resources :products  do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :purchase, only: [:index] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
end