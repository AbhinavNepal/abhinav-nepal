class AddInstituteIdToScholar < ActiveRecord::Migration[5.1]
  def change
    add_reference :scholars, :institute, foreign_key: {references: :institutes}
  end
end
