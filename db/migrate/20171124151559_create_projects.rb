class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.references :company, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
