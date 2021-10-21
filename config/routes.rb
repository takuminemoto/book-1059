Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "home/about" => "homes#about" ,as: "about"
  get 'searches/search'
  get '/search', to: 'searches#search'
  resources :images, only: [:index, :show, :create, :destroy, :new]

  resources :books, only: [:index, :show, :edit, :create, :destroy, :update, :new] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :create, :destroy, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :contacts, only: [:new, :create]
  post '/confirm' => 'contacts#confirm'
  post '/back' => 'contacts#back'
  get '/done' => 'contacts#done'
end
