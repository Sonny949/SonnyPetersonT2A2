Rails.application.routes.draw do
  get 'listings', to: 'listings#index'
  get 'listings/new', to: 'listings#new'
  post 'listings', to: 'listings#create'
  get 'listings/:id', to: 'listings#show', as: 'listing'
  get 'listings/:id/edit', to: 'listings#edit', as: 'edit_listing'
  patch 'listings/:id', to: 'listings#update'
  delete 'listings/:id', to: 'listings#destroy'
  get 'posts', to: 'posts#index'
  get 'posts/new', to: 'posts#new'
  post 'posts', to: 'posts#create'
  get 'posts/:id', to: 'posts#show', as: 'post'
  get 'posts/:id/edit', to: 'posts#edit', as: 'edit_post'
  patch 'posts/:id', to: 'posts#update'
  delete 'posts/:id', to: 'posts#destroy'
  root 'pages#home'
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  devise_for :users
end
