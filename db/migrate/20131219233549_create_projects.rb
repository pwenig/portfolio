class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :link
      t.date :date
      t.string :image
      t.text :technologies

      t.timestamps
    end
  end
end
