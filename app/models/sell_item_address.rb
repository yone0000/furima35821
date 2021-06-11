class SellItemAddress < ActiveHash::Base
    include ActiveModel::Model
    attr_accessor :price, :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :sell_item_id, :user_id, :item_id, :token

    with_options presence: true do
      validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
      validates :prefecture_id, numericality: { other_than: 1 }
      validates :city
      validates :house_number
      validates :phone_number, format: { with:  /\A\d{10,11}\z/}    
      validates :user_id
      validates :item_id
      validates :token
    end

  
    def save
      # 各テーブルにデータを保存する処理を書く   
        sell_item = SellItem.create(user_id: user_id, item_id: item_id)
        Address.create!(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number, sell_item_id: sell_item_id )
    end
end

