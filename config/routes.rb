Rails.application.routes.draw do

  root "scholars#index"

  resources :scholars, only: [:index]

  # pages
  get "about" => "pages#about"
  get "privacy" => "pages#privacy"

end
