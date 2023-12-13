Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # get 'users/:user_id/posts' => 'posts#index', as: 'user_posts'
  # get 'users/:user_id/posts/:id' => 'posts#show', as: 'user_post'
  # get 'users' => 'users#index', as: 'users'
  # get 'users/:id' => 'users#show', as: 'user'
  root 'users#index'
  resources :users do
    resources :posts do
      resources :comments
      resources :likes
    end
  end
end
