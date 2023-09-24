Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root to: "items#index"
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


