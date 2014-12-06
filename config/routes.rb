ZivotnamotorkachRails::Application.routes.draw do
  devise_for :users

  resources :blog_posts, path: 'blog', only: [:index, :show]
  root to: 'root#index'
end
