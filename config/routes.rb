Rails.application.routes.draw do
  namespace :api do
    get "/product" => "products#show_products"
    get "/all_product" => "products#all_products"
  end
end
