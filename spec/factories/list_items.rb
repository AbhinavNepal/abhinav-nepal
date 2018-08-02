FactoryBot.define do
  factory :list_item, class: ListItem do
    position { 1 }

    trait :for_org_positions do
      label { Faker::Company.profession }
      association :list, factory: :org_positions_list
    end

    trait :for_publication_sources do
      label { ["Google Scholar", "Researchgate", "Other"].sample }
      association :list, factory: :publication_sources_list
    end
  end
end
