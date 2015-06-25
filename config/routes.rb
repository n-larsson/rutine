Rails.application.routes.draw do
  namespace :v1 do
    resources :routines, only: [:create]
  end

  root "health#show"
end
