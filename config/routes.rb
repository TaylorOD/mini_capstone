Rails.application.routes.draw do
  namespace :api do
    get "/product" => "products#show_products"
  end

  namespace :api do
    get "/all_product" => "products#all_products"
  end
end
