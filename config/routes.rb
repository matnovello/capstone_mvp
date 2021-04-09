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
  end
end
