Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  get 'sessions/create'
  get 'sessions/destroy'

  namespace :admin do
    resources :categories
    resources :products
    resources :users
    resources :users do
      put :update_password, on: :member
    end
    resources :orders
    resources :stats, only: :index
  end

  resources :categories

  get '/search', to: 'store#search'

  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
    resources :categories
    root 'store#index', as: 'store_index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

