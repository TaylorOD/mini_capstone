Rails.application.routes.draw do
  namespace :api do
    get "/product" => "products#show_products"
    get "/all_product" => "products#all_products"

    post "/product_"

    get "/one_product_path" => "products#one_product_action"
    get "/one_product_path/:product_id" => "products#one_product_action"
  end
end
