Rails.application.routes.draw do
  # get 'users/:user_id/posts' => 'posts#index', as: 'user_posts'
  # get 'users/:user_id/posts/:id' => 'posts#show', as: 'user_post'
  # get 'users' => 'users#index', as: 'users'
  # get 'users/:id' => 'users#show', as: 'user'
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts do
      resources :comments, only: [:new, :create]
      resources :likes, only: [ :create, :new]
    end
  end
end
