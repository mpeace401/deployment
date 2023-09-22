Rails.application.routes.draw do
  root to: "items#index"
  resources :users
  resources :comments
  resources :posts do
    resources :comments
  end
  resources :items do
    member do
      get :delete
    end
  end
  get 'member-items', to: 'items#member_items'
end
