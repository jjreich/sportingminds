Rails.application.routes.draw do
  resources :goals
  devise_for :users
  resources :journal_entries
  resources :sports
  resources :training_types
  resources :goal_types
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

end
