Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :user_posts, only: [:index]
      end
  
      resources :posts do
        resources :post_comments, only: [:index, :create]
      end
    end
  end



  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'users#index'
  resources :users do
    resources :posts do
      resources :comments
      resources :likes
    end
  end
end
