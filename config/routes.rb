Rails.application.routes.draw do
  resources :draft_tags
  resources :tags
  resources :articles
  resources :releases
  resources :draft_contents
  resources :drafts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
