class Api::ProductsController < ApplicationController
  def show_products
    @products = "Look at these products!"
    render "product.json.jb"
  end
end
