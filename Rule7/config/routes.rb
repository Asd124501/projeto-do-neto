Rails.application.routes.draw do
  resources :rulesets
  root "rulesets#index"
end
