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
    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_message }
    end
  end

  def update
    # how does this search work?
    @product = Product.find_by(id: params[:id])

    # how do these gates work?
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    @product.save

    render "show.json.jb"
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: { message: "Product destroyed." }
  end
end
