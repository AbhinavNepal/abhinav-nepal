require "feature_spec_helper"

RSpec.feature "Scholar", type: :feature do
  describe "create a scholar" do
    let!(:discipline) { create(:sub_discipline) }
    let!(:org_position) { create(:list_item, :for_org_positions) }
    let!(:publication_source) { create(:list_item, :for_publication_sources) }

    it "is successfully created" do
      expect(Scholar.count).to eq(0)

      visit new_scholar_path
      fill_in "scholar[first_name]", with: Faker::Name.first_name
      fill_in "scholar[last_name]", with: Faker::Name.last_name
      select(discipline.title, from: "Discipline")

      fill_in "scholar[organisation_attributes][name]", with: Faker::Company.name
      select(org_position.label, from: "Position")
      select(Faker::Address.country, from: "Country")

      within("div.publication_web_urls") do
        select(publication_source.label, from: "Title")
        fill_in "scholar[web_urls_attributes][0][url]", with: Faker::Internet.url
      end

      fill_in "scholar[created_by_attributes][email]", with: Faker::Internet.email

      click_on("Save")
      expect(Scholar.count).to eq(1)
    end
  end
end
