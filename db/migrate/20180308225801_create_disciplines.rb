class CreateDisciplines < ActiveRecord::Migration[5.1]
  def change
    create_table :disciplines do |t|
      t.string :title, null: false
      t.string :code, null: false
      t.integer :parent_id
    end
  end
end
