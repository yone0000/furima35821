FactoryBot.define do
    factory :user do
      nickname {"佐藤"}
      email {Faker::Internet.free_email}
      password {'1a' + Faker::Internet.password(min_length: 7)}
      password_confirmation {password}
      last_name {"佐藤"}
      first_name {"太郎"}
      last_name_kana {"サトウ"}
      first_name_kana {"タロウ"}
      birth_date {"2000-01-01"}
    end
  end
