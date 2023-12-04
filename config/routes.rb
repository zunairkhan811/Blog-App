Rails.application.routes.draw do
  get 'users/:user_id/posts' => 'posts#index'
  get 'users/:user_id/posts/:id' => 'posts#show'
  get 'users' => 'users#index'
  get 'users/:id' => 'users#show'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
