class Api::ProductsController < ApplicationController
  def index
    # http://localhost:3000/api/products?search=search_text - url example
    @products = Product.all

    if params[:search]
      @products = @products.where("name ILIKE?", "%#{params[:search]}%")
    end

    if params[:sort] == "price" && params[:sort_order] == "desc"
      @products = @products.order(:price => :desc)
    end

    if params[:sort] == "price"
      @products = @products.order(:price => :asc)
    end

    @products = @products.order(:id => :asc)
    render "index.json.jb"
  end

  def show
    # http://localhost:3000/api/products/1
    @product = Product.find_by(id: params[:id])
    render "show.json.jb"
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
      render json: { errors: @product.errors.full_messages }, status: :bad_request
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

    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: { message: "Product destroyed." }
  end
end
