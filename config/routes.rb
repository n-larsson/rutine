Rails.application.routes.draw do
  namespace :v1 do
    resources :routines, only: [:create] do
      resources :tasks, only: [:create]
    end
  end

  root "health#show"
end
