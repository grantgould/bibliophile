Rails.application.routes.draw do

  resources :authors
  resources :genres
  resources :books do 
    member do 
      resource :reviews 
    end
  end

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
