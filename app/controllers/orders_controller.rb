class OrdersController < ApplicationController


    def index
      @order_form = OrderForm.new
      @item = Item.find(params[:item_id])
    end
    def create
      @order_form = OrderForm.new(order_params)
      @item = Item.find(params[:item_id])
      if @order_form.valid?
        pay_item
        @order_form.save(params,current_user.id)
        return redirect_to root_path
      else
        render :index
      end
    end
  

    private
  
    def order_params
      params.require(:order_form).permit( :post_code, :prefecture_id, :municipalitie, :address, :building, :tell).merge(token: params[:token],item_id: params[:item_id], user_id: current_user.id)
    end

    def pay_item
      Payjp.api_key = "sk_test_431ac87911d3017fa7f56765" 
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
        )
    end
end