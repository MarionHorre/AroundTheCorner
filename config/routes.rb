Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/search", to: 'pages#search_form'
  get "/recap", to: "pages#recap"
  get "/districts", to: "districts#index"
  post "/districts", to: "districts#search"
  get "/houses", to: "houses#index"
  get "/houses", to: "houses#show", as: "houses_details" # vérifier comment faire la show
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
