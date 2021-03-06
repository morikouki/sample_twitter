Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homes#top'
  get 'about' => 'homes#about'

  resources :users, only: [:index, :show, :edit, :update] do
  	resource :relationships, only: [:create, :destroy]
  end

  resources :posts, only: [:index, :create, :show, :update, :destroy] do
  	resource :favorites, only: [:create, :destroy]
  	resources :post_comments, only: [:create, :destroy]
  end
end
