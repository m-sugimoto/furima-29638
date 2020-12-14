FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6, mix_case: true)}
    # password {"aaa111"}
    password_confirmation {password}
    firstname             {"田中"}
    name                  {"太郎"}
    firstname_reading     {"タナカ"}
    name_reading          {"タロウ"}
    birthday              {Faker::Date.between(from: '2014-09-23', to: '2014-09-25')}
    #birthday {"1995-04-01"}
  end
end
