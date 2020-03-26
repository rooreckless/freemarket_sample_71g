Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root to: "products#index"
  #上の記述はデプロイができている確認用のビューを表示するためのものです。確認出来次第削除願います。
  #また、デプロイが確認されたあとは、deploytestコントローラと、views内のdeploytestディレクトリも削除願います。
  resources :cards, only: [:new, :create, :index] do
    resources :users, only: [:show,:index]
      collection do
        post 'purchase'
      end
  end
  resources :addresses, only: [:new, :create, :index]
  
  resources :products  do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
end
