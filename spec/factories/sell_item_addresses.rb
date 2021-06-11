FactoryBot.define do
  factory :sell_item_address do
     
          postal_code {"123-0023"}
          prefecture_id {3}
          city {"大阪"}
          house_number {"111"}
          building {"12"}
          phone_number {"09012342341"}
          token {"tok_abcdefghijk00000000000000000"}
  end
end
