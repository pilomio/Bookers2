Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: 'homes#top'

devise_for :users
resources :books
resources :users
get '/home/about' => 'homes#about'


end
