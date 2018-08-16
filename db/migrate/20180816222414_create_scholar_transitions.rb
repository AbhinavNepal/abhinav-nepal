class CreateScholarTransitions < ActiveRecord::Migration[5.2]

  def change
    create_table :scholar_transitions do |t|
      t.string :to_state, null: false
      t.json :metadata, default: {}
      t.integer :sort_key, null: false
      t.boolean :most_recent, null: false
      t.references :scholar, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_reference :scholar_transitions, :created_by, index: true, foreign_key: {to_table: :people}

    add_index(:scholar_transitions,
              [:scholar_id, :sort_key],
              unique: true,
              name: "index_scholar_transitions_parent_sort")
    add_index(:scholar_transitions,
              [:scholar_id, :most_recent],
              unique: true,
              where: 'most_recent',
              name: "index_scholar_transitions_parent_most_recent")

    # also add state to scholars to store current state
    add_column :scholars, :state, :string
  end

end
