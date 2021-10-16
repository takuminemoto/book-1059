Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "home/about" => "homes#about" ,as: "about"
  get 'searches/search'
  resources :images, only: [:index, :show, :create, :destroy, :new]
  resources :users, only: [:index, :show, :edit, :create, :destroy, :update]
  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  get '/search', to: 'searches#search'
end

