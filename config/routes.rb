Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end
  namespace :api do

    #creates new game
    post "/games" => "games#create"
    get "/games/:id" => "games#show"
    patch "/games/:id" => "games#update"

    patch "/games/user_run" => "games#user_run"
    #monsters routes
    get "/monsters/:id" => "monsters#show"
    patch "/monsters/:id" => "monsters#battle"
    #room routes
    get "/rooms/:id" => "rooms#user_run"
    #user routes
    get "/users/:id/loots" => "users#show_loots"
    get "/users/:id" => "users#show"
    #user_loots routes
    post "user_loots" => "user_loots#add_to_inventory"
  end
end
