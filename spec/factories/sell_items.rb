FactoryBot.define do
  factory :sell_item do
    association :user
    association :item
        post_code {"123-0023"}
        prefecture_id {1}
        city {"大阪"}
        house_number {111}
        phone_number {"09012342341"}
  end
end
