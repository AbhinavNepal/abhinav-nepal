FactoryBot.define do
  factory :scholar, class: Scholar do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    association :discipline, factory: :sub_discipline
    association :created_by, factory: :person

    trait :approved do
      state { :approved }
    end
    trait :in_review do
      state { :in_review }
    end
  end
end
