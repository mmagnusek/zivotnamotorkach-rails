ZivotnamotorkachRails::Application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :blog_posts
    resources :trips do
      put :archive, on: :member
    end
  end

  resources :blog_posts, path: 'blog', only: [:index, :show]
  resources :trips,      path: 'cesty', only: :show

  get :sponsors, to: 'pages#sponsors', path: 'sponzori'

  root to: 'pages#homepage'
end
