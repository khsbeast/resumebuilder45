#Migration to create Projects table
class AddProjects2 < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :url
      t.string :techstack
      t.text :description

      t.belongs_to :profile, foreign_key: true

      t.timestamps
    end
  end
end
