FactoryBot.define do
  factory :post do
    association :user
    title              { Faker::Lorem.word }
    text       { Faker::Lorem.sentence }
    reference       { Faker::Internet.url }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
