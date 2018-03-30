class CreateOrganisations < ActiveRecord::Migration[5.1]
  def change
    create_table :organisations do |t|
      t.string :name, null: false
      t.string :position, null: false
      t.string :country_code, null: false
      t.references :scholar, index: true, foreign_key: true

      t.timestamps
    end
  end
end
