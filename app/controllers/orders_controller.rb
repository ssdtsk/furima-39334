class OrdersController < ApplicationController
    def index
      @items = Item.all # Assuming you want to fetch all items here
      @item = @items.first 
    end
  
    def create
      @order = Order.new(order_params)
      if @order.save
        # レコード保存成功時の処理
        redirect_to orders_path, notice: '注文が正常に作成されました！'
      else
        # レコード保存失敗時の処理
        render :index
      end
    end
    def order_params
      params.require(:order).permit(:name, :email, :address) # 保存したいパラメータを指定
    end
end
