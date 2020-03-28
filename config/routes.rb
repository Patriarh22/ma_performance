Rails.application.routes.draw do
  root to: 'sources#index'

  resources :sources, only: :index do
    member do
      get :sync_posts
      get :sync_comments
    end
    resources :posts, only: :show do
      member do
        get :sync_comments
      end
    end
  end
end
