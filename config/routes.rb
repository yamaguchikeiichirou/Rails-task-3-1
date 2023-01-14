Rails.application.routes.draw do
  devise_for :users
  resources :books, :users, only: [:new, :index, :show, :edit]
  post 'users' => 'users#create'
  post 'books' => 'books#create'
  post 'users/:id' => 'users#create'
  post 'books/:id' => 'books#create'
  patch 'books/:id' => 'books#update'
  patch 'users/:id' => 'users#update'
  root to: "homes#top"
  get 'home/about'=>'homes#about'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
