class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user

  def index
    @carted_products = current_user.carted_products
    render "index.json.jb"
  end

  def create
    @carted_product = CartedProduct.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
      user_id: current_user.id,
      status: "carted",
    )
    if @carted_product.save
      render json: { message: "Carted!" }, status: :created
    else
      render json: { message: "Error - Figure it out!" }, status: :bad_request
    end
  end
end
