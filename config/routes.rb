Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items
  root to: 'item/index'
  get 'items/:id', to: 'items#checked'
  get "/" => 'item#top'
end
