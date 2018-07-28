Rails.application.routes.draw do
  devise_for :users
  root "scholars#index"

  resources :scholars, only: [:index, :new, :create] do
    collection { post :search, to: "scholars#index" }
  end

  # pages
  get "about" => "pages#about"
  get "privacy" => "pages#privacy"
end
