class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render "index.json.jb"
  end

  def show
    @order = current_user.orders.find_by(id: params[:id])
    render "show.json.jb"
  end

  def create
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

    if @order.save
      render "show.json.jb"
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end
end
