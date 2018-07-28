class CreateWebUrls < ActiveRecord::Migration[5.1]

  def change
    create_table :web_urls do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.string :code, null: false
      t.references :linkable, polymorphic: true, index: true
    end
  end

end
