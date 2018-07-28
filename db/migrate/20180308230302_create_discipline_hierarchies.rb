class CreateDisciplineHierarchies < ActiveRecord::Migration[5.1]

  def change
    create_table :discipline_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :discipline_hierarchies, [:ancestor_id, :descendant_id, :generations], unique: true,
                                                                                     name: "discipline_anc_desc_idx"

    add_index :discipline_hierarchies, [:descendant_id], name: "discipline_desc_idx"
  end

end
