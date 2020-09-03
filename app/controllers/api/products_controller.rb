class Api::ProductsController < ApplicationController
  def show_products
    @product = Product.first
    render "product.json.jb"
  end

  def all_products
    @all_products = Product.all
    render "all_product.json.jb"
  end

  def one_product_action
    # http://localhost:3000/api/one_product_path?product_id=1
    # http://localhost:3000/api/one_product_path/1
    @product = Product.find_by(id: params["product_id"])
    render "product.json.jb"
  end
end
