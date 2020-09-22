class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    # http://localhost:3000/api/products?search=search_text - url example
    @products = Product
      .title_search(params[:search])
      .discounted(params[:discount])
      .sorted(params[:sort], params[:sort_order])

    if params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.products
    end

    render "index.json.jb"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id],
    )
    if @product.save
      Image.create!(product_id: @product.id, url: params[:image_url])
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: :bad_request
    end
  end

  def show
    # http://localhost:3000/api/products/1
    @product = Product.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    if current_user
      @product = Product.find_by(id: params[:id])
      @product.name = params[:name] || @product.name
      @product.price = params[:price] || @product.price
      @product.description = params[:description] || @product.description
      if @product.save
        render "show.json.jb"
      else
        render json: { errors: @product.errors.full_messages }, status: :bad_request
      end
    else
      render json: { errors: "Log in to update an item." }, status: :bad_request
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: { message: "Product destroyed." }
  end
end
