require "feature_spec_helper"

RSpec.feature "Scholar", type: :feature do
  describe "scholars/new" do
    before(:each) { visit new_scholar_path }

    it "renders new scholar form" do
      expect(page).to have_selector("h4", text: "Add Scholar")

      within(".scholars form#scholar-form") do
        expect(page).to have_selector("div.card-header", text: "Details")
        expect(page).to have_selector("input#scholar_first_name")
        expect(page).to have_selector("select#scholar_discipline_id")

        expect(page).to have_selector("div.card-header", text: "Organisation")
        expect(page).to have_selector("input#scholar_organisation_attributes_name")

        expect(page).to have_selector("div.card-header", text: "Publication links")
        expect(page).to have_selector("select#scholar_web_urls_attributes_0_title")

        expect(page).to have_selector("div.card-header", text: "Personal links")
        expect(page).to have_selector("select#scholar_web_urls_attributes_1_title")
      end
    end
  end
end
