FactoryBot.define do
  factory :item do
    association :user
    name {"パソコン"}
    info {"プログラミング"}
    category_id {2}
    sales_status_id {2}
    shipping_fee_status_id {2}
    prefecture_id {2}
    schedule_delivery_id {2}
    price {12345}
  end
end
