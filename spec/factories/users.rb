FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              {"111aaa"}
    password_confirmation {password}
    nickname              {Faker::Name.initials(number: 2)}
    last_name             {"山田"}
    first_name            {"太郎"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birthday              {Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}
  end
end