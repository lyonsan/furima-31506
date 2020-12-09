FactoryBot.define do
  factory :item do
    image            { Rack::Test::UploadedFile.new(Rails.root.join('app', 'assets', 'images', 'icon_camera.png'), 'image/png') }
    title            { Faker::Lorem.word}
    explanation      { Faker::Lorem.sentence}
    category_id      { Faker::Number.between(from: 2, to: 11) }
    status_id        { Faker::Number.between(from: 2, to: 7) }
    delivery_fee_id  { Faker::Number.between(from: 2, to: 3) }
    prefecture_id    { Faker::Number.between(from: 2, to: 48) }
    delivery_date_id { Faker::Number.between(from: 2, to: 4) }
    price            { Faker::Number.between(from: 300, to: 9999999) }
    association :user
  end
end
