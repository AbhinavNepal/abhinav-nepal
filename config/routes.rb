require "sidekiq/web"
require "sidekiq-scheduler/web"

Rails.application.routes.draw do
  devise_for :users
  root "scholars#index"

  resources :scholars, only: [:index, :new, :create, :show, :edit, :update] do
    collection { post :search, to: "scholars#index" }
    patch :approve, on: :member
  end

  # pages
  get "about" => "pages#about"
  get "privacy" => "pages#privacy"

  authenticate :user, ->(u) { u.has_role? :admin } do
    mount Sidekiq::Web => "/sidekiq"
  end
end
