class OrdersController < ApplicationController
  before_action :second_item, only: [:index, :create]
  before_action :orderlog, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save(params, current_user.id)
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def second_item
    @item = Item.find(params[:item_id])
    @item.update(sold_out: true) if @item.sold_out?
  end

  def order_params
    params.require(:order_form).permit(:post_code, :prefecture_id, :municipalitie, :address, :building, :tell).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def orderlog
    if current_user.present?
      if current_user == @item.user || @item.order.present?
        redirect_to root_path
      end
    else
      redirect_to new_user_session_path
    end
  end
end