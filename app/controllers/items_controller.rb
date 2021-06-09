class ItemsController < ApplicationController
    before_action :authenticate_user!, only:[:new, :create, :edit, :update]
    before_action :set_item, only: [:show, :edit, :update]
    before_action :set_user, only: [:edit, :update]

    def index 
        @items = Item.all
        @items = Item.all.order("created_at DESC") 
       
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
    
    # def destoroy
    # end

    def show
        @items = Item.includes(:user)
        
    end

    
    def edit 
        @items = Item.includes(:user)
        
    end

    def update
        if @item.update(item_params)
           redirect_to item_path
        else
          render :edit
        end
    end

    # def purchase
    #     @item= Item.find(params[:id])
    #     @item.update(buyer_id: current_user.id)
    #   end


      private
      def item_params
        params.require(:item).permit(:name, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :schedule_delivery_id, :price, :image).merge(user_id: current_user.id)
      end

      def set_item
        @item = Item.find(params[:id])
      end

      def set_user
        unless @item.user_id == current_user.id
            redirect_to root_path
        end
      end
end


