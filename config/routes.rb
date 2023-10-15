Rails.application.routes.draw do
  get 'users/index'
  get 'users/edit'
  # if user is not an admin, going to /admins will give 404 error
  authenticated :user, -> (user) { user.admin? } do
    get 'admin', to: 'admin#index'
    get 'admin/users'
    get 'admin/transactions'
    patch 'admin/users/:id', to: 'admin#update', as: 'admin/user'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root to: "items#index"

  #get '/items/export', to:'items#export' 
  #post 'items/import', to: 'items#import', as: 'import_items'

  post 'items/checkout', to: 'items#checkout', as: 'import_items'
  post 'button_action/:id', to: 'items#button_action'

  resources :items do
    member do
      get :delete
      #post :button_action
    end
  end
  resources :transactions do
    member do
      get :delete
    end
  end

  get 'member-items', to: 'items#member_items'
  get 'transactions', to: 'transactions#index'
  
  #post 'button_action2/:id', to: 'transactions#button_action2'
  #get 'button_action', to: 'items#index'
end
