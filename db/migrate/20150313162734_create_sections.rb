class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.string :slug
      t.text :description

      t.timestamps null: false
    end
  end
end
