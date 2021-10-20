Rails.application.routes.draw do
  root to: "home#index"
  resources :movies, only: %i[index show]
  resources :production_companies, only: %i[index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
