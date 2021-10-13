Rails.application.routes.draw do
 root to: 'homes#top'
 devise_for :users
 get "home/about" => "homes#about" ,as: "about"
 resources :images, only: [:new, :create, :index, :show, :destroy]
 resources :users, only: [:show, :edit, :update, :index]
 resources :books, only: [:create, :index, :show, :destroy, :update, :edit]
end

