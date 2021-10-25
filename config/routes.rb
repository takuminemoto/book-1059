# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  get 'searches/search'
  get '/search', to: 'searches#search'
  resources :images, only: %i[index show create destroy new]

  resources :books, only: %i[index show edit create destroy update new] do
    resource :favorites, only: %i[create destroy]
    resources :book_comments, only: %i[create destroy]
    resource :timeline, only: [:show]
  end

  resources :users, only: %i[index show edit create destroy update] do
    resource :relationships, only: %i[create destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :contacts, only: %i[new create]
  post '/confirm' => 'contacts#confirm'
  post '/back' => 'contacts#back'
  get '/done' => 'contacts#done'
end
