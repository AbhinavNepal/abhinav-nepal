class AddOtherDisciplineAndNotes < ActiveRecord::Migration[5.2]

  def change
    add_disciplines
    add_column :scholars, :notes, :string
  end

  private

  def add_disciplines
    parent = Discipline.create! title: "Other", code: "other_discipline"
    parent.children.create! title: "Other", code: "other_sub_discipline"
  end

end
