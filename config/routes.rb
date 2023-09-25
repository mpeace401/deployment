Rails.application.routes.draw do
  # if user is not an admin, going to /admins will give 404 error
  authenticated :user, -> (user) { user.admin? } do
    get 'admin', to: 'admin#index'
    get 'admin/users'
  end
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


