require "csv"

class InsertDefaultDisciplinesAndSubDisciplines < ActiveRecord::Migration[5.1]
  def change
    CSV.foreach(Rails.root + "db/migrate/#{version}_default_disciplines_and_sub_disciplines.csv", headers: true) do |csv|
      row = csv.to_hash
      discipline = row["discipline"]
      discipline_code = row["discipline_code"]
      sub_discipline = row["sub_discipline"]
      sub_discipline_code = row["sub_discipline_code"]

      say_with_time "Generating #{discipline_code} > #{sub_discipline_code}" do
        parent = Discipline.find_or_create_by title: discipline, code: discipline_code
        parent.children.find_or_create_by title: sub_discipline, code: sub_discipline_code
      end
    end
  end
end
