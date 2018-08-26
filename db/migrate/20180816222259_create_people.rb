class CreatePeople < ActiveRecord::Migration[5.2]

  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, null: false, default: ""
      t.references :user, index: true, foreign_key: true # link person <-> user (authenticating model)

      t.timestamps
    end
    add_index :people, :email, unique: true

    add_reference :users, :person, index: true, foreign_key: true
  end

end
