ZivotnamotorkachRails::Application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :blog_posts
  end

  resources :blog_posts, path: 'blog', only: [:index, :show]
  root to: 'root#index'
end
