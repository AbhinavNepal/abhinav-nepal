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

    it "renders list of approved scholars" do
      approved_scholar = create(:scholar, :approved)
      pending_scholar = create(:scholar, :in_review)

      visit scholars_path
      within(".scholars div#scholar-results") do
        expect(page).to have_text approved_scholar.name
        expect(page).not_to have_text pending_scholar.name
      end
    end
  end
end
