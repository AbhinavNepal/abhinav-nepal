class RolifyCreateRoles < ActiveRecord::Migration[5.1]

  def change
    create_table(:roles) do |t|
      t.string :name
      t.references :resource, polymorphic: true
      t.string :description

      t.timestamps
    end

    create_table(:users_roles, id: false) do |t|
      t.references :user
      t.references :role
    end

    add_index(:roles, [:name, :resource_type, :resource_id])
    add_index(:users_roles, [:user_id, :role_id])

    # generate default role
    execute <<-SQL
      INSERT INTO roles (name, description, created_at, updated_at)
           VALUES ('admin', 'Ability to manage everything except own permissions', current_timestamp, current_timestamp);
    SQL
  end

end
