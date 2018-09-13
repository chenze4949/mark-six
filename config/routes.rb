Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "drawings#index"

  devise_for :users

  resources :drawings do
    resources :tickets
  end
end
