Rails.application.routes.draw do
 get 'searches/search'
 devise_for :users
 root to: 'homes#top'
 get "home/about" => "homes#about" ,as: "about"
 resources :images, only: [:index, :show, :create, :destroy, :new]
 resources :users, only: [:index, :show, :edit, :create, :destroy, :update]
 resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
  resource :favorites, only: [:create, :destroy]
 end
 get '/search', to: 'searches#search'
end

