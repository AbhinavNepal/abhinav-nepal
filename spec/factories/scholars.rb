FactoryBot.define do
  factory :scholar, class: Scholar do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    association :discipline, factory: :sub_discipline
  end
end
