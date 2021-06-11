class BuyItemsController < ApplicationController
    before_action :authenticate_user!, only: [:index,:new, :create]
    before_action :set_item, only: [:index]
    before_action :sold_out_item, only: [:index]
    def index    
        @sell_item_address = SellItemAddress.new
        @items = Item.all
    end

    def new 
    end

  
    def create
        @item = Item.find(params[:item_id])
        @sell_item_address = SellItemAddress.new(sell_item_address_params)
        if @sell_item_address.valid?
            pay_item
        @sell_item_address.save
            return redirect_to root_path
        else
            render :index
        end
    end


    private

    def sell_item_address_params
      params.require(:sell_item_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end
    def pay_item       
            Payjp.api_key = "sk_test_bfd5cd8aa15a6aaf79e09861"  
            Payjp::Charge.create(
              amount: @item.price,  
              card: sell_item_address_params[:token],    
              currency: 'jpy'                 
            )
    end

    def set_item
        @item = Item.find(params[:item_id])
    end
    def sold_out_item
        redirect_to root_path if @item.sell_item.present?
    end

  end

