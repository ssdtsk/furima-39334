class OrdersController < ApplicationController


    def index
      @order_form = OrderForm.new
      @item = Item.find(params[:item_id])
    end
    def create
      @order_form = OrderForm.new(order_params)
      if @order_form.valid?
        @order_form.save(params,current_user.id)
        return redirect_to root_path
      else
        @item = Item.find(params[:item_id])
        render :index
      end
    end
  

    private
  
    def order_params
      params.require(:order_form).permit( :post_code, :prefecture_id, :municipalitie, :address, :building, :tell).merge(item_id: params[:item_id], user_id: current_user.id)
    end
end