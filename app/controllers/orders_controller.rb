class OrdersController < ApplicationController
  
  def index
    @orders = Order.all 
    render :index
  end

  def create
    product=Product.find_by(id: params[:product_id])
    calculated_subtotal = product.price * params[:quantity].to_i
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    
    @order = Order.create(
      product_id: params[:product_id],
      user_id: current_user.id,
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )
    render json "Order confirmed."
  end

  def show
    @order = Order.find_by(id: params[:id])
    render :show
  end



end
