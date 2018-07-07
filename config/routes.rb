Rails.application.routes.draw do
  resources :formations, only: %i(index show new create edit update)
  resources :teams, only: %i(show new create edit update) do
    resources :players, only: %i(edit update)
  end

  root 'teams#index'
end
