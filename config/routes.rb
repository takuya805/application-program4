Rails.application.routes.draw do
  devise_for :users
  root :to =>"homes#top"
  get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]
  resources :users, only: [:index,:show,:edit,:update] do
    get "follow" => "relationships#follows"
    get "followers"=>"relationships#followers"
  end
  resources :relationships, only: [:create,:destroy]
end