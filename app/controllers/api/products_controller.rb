class Api::ProductsController < ApplicationController
  def show
    # http://localhost:3000/api/products/1
    @product = Product.find_by(id: params[:id])
    render "show.json.jb"
  end

  def index
    @products = Product.all
    render "index.json.jb"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
    )
    @product.save
    render "show.json.jb"
  end
end
