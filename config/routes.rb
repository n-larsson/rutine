Rails.application.routes.draw do
  namespace :v1 do
    resources :users, only: [] do
      resources :routines, only: [] do
        resources :assignments, only: [:create, :update], controller: "routine_assignments"
      end
    end

    resources :routines, only: [:create] do
      resources :tasks, only: [:create]
    end
  end

  root "health#show"
end
