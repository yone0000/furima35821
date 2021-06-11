class Item < ApplicationRecord

    belongs_to :user
    has_one_attached :image
    has_one :sell_item


    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :sales_status
    belongs_to :prefecture
    belongs_to :schedule_delivery
    belongs_to :shipping_fee_status
    
    with_options presence: true do
        validates :image
        validates :name, length: { minimum: 1, maximum: 40 }
        validates :info, length: { minimum: 1, maximum: 1000 }
        validates :category_id
        validates :sales_status_id
        validates :shipping_fee_status_id
        validates :prefecture_id
        validates :schedule_delivery_id
        validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/, message: "Price is not included in the list" }   
    end

    
    with_options numericality: { other_than: 1 } do
       validates :category_id
       validates :sales_status_id
       validates :shipping_fee_status_id
       validates :prefecture_id
       validates :schedule_delivery_id
    end
    validates :price, numericality: true
end



