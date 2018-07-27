class CreateLists < ActiveRecord::Migration[5.2]

  def change
    create_table :lists do |t|
      t.string :code, null: false
    end

    create_table :list_items do |t|
      t.string :label, null: false
      t.integer :position, null: false
      t.references :list, index: true, foreign_key: true
    end

    generate_org_position_list
  end

  private

  def generate_org_position_list
    list = List.create! code: "org_positions"

    org_positions.each_with_index do |label, index|
      list.list_items.create! label: label, position: (index + 1)
    end
  end

  def org_positions
    ["Assistant Professor",
     "Associate Professor",
     "Clinical Researcher",
     "Industry Research Scientist",
     "Industry Research Engineer",
     "Lecturer",
     "PhD Candidate",
     "Postdoctoral Researcher",
     "Professor",
     "Reader",
     "Research Assistant"]
  end

end
