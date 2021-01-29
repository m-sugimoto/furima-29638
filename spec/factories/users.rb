FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"a1"+Faker::Internet.password(min_length: 6, mix_case: true)}
    password_confirmation {password}
    firstname             {"田中"}
    name                  {"太郎"}
    firstname_reading     {"タナカ"}
    name_reading          {"タロウ"}
    birthday              {Faker::Date.between(from: '2014-09-23', to: '2014-09-25')}
  end
end
