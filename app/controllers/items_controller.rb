class ItemsController < ApplicationController
    before_action :authenticate_user!, only:[:new, :create]

    def index 
        @items = Item.all.order(id: "DESC") 
       
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
        if  @item.save
            redirect_to root_path
        else
            render :new
        end      
    end

    def show
    end

    
    def edit 
    end
    
    def destoroy
    end
      private
      def item_params
        params.require(:item).permit(:name, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :schedule_delivery_id, :price, :image).merge(user_id: current_user.id)
      end
end


