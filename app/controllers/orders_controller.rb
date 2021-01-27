class OrdersController < ApplicationController
  before_action :authenticate_user!, only:[:index, :create] 
  before_action :order_item_params, only:[:index, :create] 
  def index
    if @item.order != nil
      redirect_to root_path
    end
    if current_user.id == @item.user_id
      redirect_to root_path
    end
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_order
      @order_form.save
      redirect_to root_path  
     else
      render 'index'
    end
    
  end

  private
  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telnumber ).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def order_item_params
    @item = Item.find(params[:item_id])
  end

  def pay_order
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
