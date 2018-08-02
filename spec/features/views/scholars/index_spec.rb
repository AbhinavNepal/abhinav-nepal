require "feature_spec_helper"

RSpec.feature "Scholar", type: :feature do
  describe "scholars/index" do
    it "contains search fields" do
      visit scholars_path
      within(".scholars form#scholar_search") do
        expect(page).to have_selector("input#q_name_or_description_cont")
        expect(page).to have_selector("select#q_discipline_id_or_discipline_parent_id_eq")
      end
    end

    it "contains button to add new scholar" do
      visit scholars_path
      expect(page).to have_link(href: new_scholar_path)
    end

    it "renders list of scholars" do
      scholar = create(:scholar)

      visit scholars_path
      within(".scholars div#scholar-results") do
        within("div.card") do
          expect(page).to have_text scholar.name
        end
      end
    end
  end
end
