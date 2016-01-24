ZivotnamotorkachRails::Application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :assets
    resources :blog_posts
    resources :trips do
      put :archive, on: :member
    end

    root to: redirect('/admin/blog_posts')
  end

  resources :blog_posts, path: 'blog',    only: [:index, :show]
  resources :postcards,  path: 'pohled',  only: [:new, :create]
  resources :news,       path: 'novinky', only: :index
  resources :trips,      path: 'cesty',   only: :show

  get :sponsors, to: 'pages#sponsors', path: 'sponzori'

  root to: 'pages#homepage'
end
