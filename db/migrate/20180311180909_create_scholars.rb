class CreateScholars < ActiveRecord::Migration[5.1]

  def change
    create_table :scholars do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.text :description

      t.timestamps
    end
    add_reference :scholars, :discipline, foreign_key: {references: :disciplines}
  end

end
