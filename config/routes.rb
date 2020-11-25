require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"

  devise_for :users
  root "scholars#index"

  resources :scholars, only: [:index, :new, :create, :edit, :update] do
    collection { post :search, to: "scholars#index" }
    patch :approve, on: :member
  end

  # pages
  get "about" => "pages#about"
  get "privacy" => "pages#privacy"
end
