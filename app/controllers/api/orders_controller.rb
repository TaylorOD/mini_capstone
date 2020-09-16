class Api::OrdersController < ApplicationController
  def index
    if current_user
      @orders = current_user.orders
      render "index.json.jb"
    else
      render json: { errors: "Log in to see your orders." }, status: :bad_request
    end
  end

  def show
    if current_user
      @order = current_user.orders.find_by(id: params[:id])
      # @order = current_user.orders
      render "show.json.jb"
    else
      render json: { errors: "Log in to see your orders." }, status: :bad_request
    end
  end

  def create
    if current_user
      product = Product.find_by(id: params[:product_id])
      subtotal = product.price * params[:quantity].to_i
      tax = 0.9 * params[:quantity].to_i
      total = subtotal + tax

      @order = Order.new(
        user_id: current_user.id,
        product_id: params[:product_id],
        quantity: params[:quantity],
        subtotal: subtotal,
        tax: tax,
        total: total,
      )

      @order.save
      render "show.json.jb"
    else
      render json: { errors: "Log in to place an order." }, status: :bad_request
    end
  end
end
