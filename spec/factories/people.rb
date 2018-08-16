FactoryBot.define do
  factory :person, class: Person do
    email { Faker::Internet.email }
  end
end
