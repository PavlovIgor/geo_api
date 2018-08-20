Rails.application.routes.draw do
  namespace :api do
    resources :points, only: [:create, :index, :destroy]
  end
end
