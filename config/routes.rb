Rails.application.routes.draw do

  resources :authors, :genres

  resources :books do 
    member do 
      resource :reviews 
    end
  end

  devise_for :users

  get "/@:username", to: "users#show", as: :user
  post "/@:username/follow", to: "users#follow", as: :follow_user
  delete "/@:username/unfollow", to: "users#unfollow", as: :unfollow_user

  root to: "main#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
