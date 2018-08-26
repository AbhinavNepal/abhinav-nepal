class AddCreatedByToScholar < ActiveRecord::Migration[5.2]

  def change
    add_reference :scholars, :created_by, index: true, foreign_key: {to_table: :people}
  end

end
