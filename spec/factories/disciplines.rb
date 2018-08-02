FactoryBot.define do
  factory :parent_discipline, class: Discipline do
    title { Faker::Company.type }
    code { title.parameterize.underscore }
  end

  factory :sub_discipline, class: Discipline do
    title { Faker::Company.industry }
    code { title.parameterize.underscore }
    association :parent, factory: :parent_discipline
  end
end
