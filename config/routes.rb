Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :client do

    get "users/new" => "users#new"
    get "users/:id" => "users#show"
    post "users" => "users#create"

    get "organizations" => "organizations#index"
    get "organizations/new" => "organizations#new"
    post "organizations" => "organizations#create"
    get "organizations/:id" => "organizations#show"
    get "organizations/:id/edit" => "organizations#edit"
    patch "organizations/:id" => "organizations#update"

    get "/login" => "sessions#new"
    post "/login" => "sessions#create"
    delete "/logout" => "sessions#destroy"

  end

end
