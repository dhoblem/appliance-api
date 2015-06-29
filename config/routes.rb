Rails.application.routes.draw do
  devise_for :users

  # You can have the root of your site routed with "root"
  root 'targets#index'
  
  get 'appliances/target' => 'appliances#pingable_targets'

  resources :targets
  resources :appliances
end
