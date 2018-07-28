class AddPersonalAndPublicationSourceToLists < ActiveRecord::Migration[5.2]

  def change
    generate_sources_list
  end

  private

  def generate_sources_list
    sources_by_type.each do |source_type, sources|
      list = List.create! code: source_type
      sources.each_with_index do |label, index|
        list.list_items.create! label: label, position: (index + 1)
      end
    end
  end

  def sources_by_type
    {
      publication_sources: ["Google Scholar", "Researchgate", "DBLP", "Other"],
      personal_sources: ["Personal", "Linkedin", "Facebook", "Twitter", "Other"]
    }
  end

end
