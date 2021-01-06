FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end  
    commodity {"カメラ"}
    explan{"性能抜群"}
    status_id{2}
    category_id{2}
    postage_id{2}
    prefecture_id{2}
    sendingday_id{2}
    price{"5000"}
    association :user
  end
end