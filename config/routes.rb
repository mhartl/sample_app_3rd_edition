Rails.application.routes.draw do
  post 'profiles/create/:id', to: 'profiles#create', as: 'create_profile'

  post 'profiles/update/:id', to: 'profiles#update', as: 'update_profile'

  get 'profiels/new', to: 'profiles#new', as: 'new_profile'

  get 'profiles/edit', to: 'profiles#edit', as: 'edit_profile'

  root                'static_pages#home'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
