Rails.application.routes.draw do
  namespace :api do
    get "/product" => "products#show_products"
  end
end
