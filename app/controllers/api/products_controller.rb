class Api::ProductsController < ApplicationController
  def show_products
    @products = "Look at these products!"
    render "product.json.jb"
  end

  def all_products
    @all_products = Product.all
    render "all_product.json.jb"
  end
end
