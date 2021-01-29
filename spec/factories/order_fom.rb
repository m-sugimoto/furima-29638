FactoryBot.define do
  factory :order_form do
    postal_code {"496-8015"}
    prefecture_id {3}
    city {"テスト"}
    house_number {"テスト"}
    building_name {"ビルハイツ１０１"}
    telnumber {"08008080808"}
    token {"0000000000000"}
  end
end