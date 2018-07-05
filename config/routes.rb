Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :client do

    get "users/new" => "users#new"
    get "users/:id" => "users#show"
    post "users" => "users#create"

  end

end
