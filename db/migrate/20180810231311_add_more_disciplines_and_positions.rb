class AddMoreDisciplinesAndPositions < ActiveRecord::Migration[5.2]

  def change
    add_disciplines
    add_org_positions
  end

  private

  def disciplines
    {
      "Economics, Trade, Finance and Business" => ["MicroEconomics",
                                                   "MacroEconomics",
                                                   "International Trade",
                                                   "International Money and Finance",
                                                   "Business Management"],
      "Food Sciences" => ["Food technology and engineering"]
    }
  end

  def add_disciplines
    disciplines.each do |discipline, sub_disciplines|
      parent = Discipline.find_or_create_by title: discipline, code: code_for(discipline)
      sub_disciplines.each do |sub_discipline|
        parent.children.find_or_create_by title: sub_discipline, code: code_for(sub_discipline)
      end
    end
  end

  def code_for(discipline)
    discipline.gsub("and", "").parameterize.underscore
  end

  def org_positions
    [
      "Research Scientist",
      "Senior Research Scientist",
      "Research Scientist Director",
      "Senior Lecturer"
    ]
  end

  def org_position_list
    @org_position_list ||= List.find_by code: "org_positions"
  end

  def add_org_positions
    position = org_position_list.list_items.maximum(:position)
    org_positions.each do |label|
      position += 1
      org_position_list.list_items.create! label: label, position: position
    end
  end

end
