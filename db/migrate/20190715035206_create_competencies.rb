class CreateCompetencies < ActiveRecord::Migration[5.2]
  def change
    create_table :competencies do |t|
      t.string :name
      t.string :level
      t.string :roadbook
      t.string :elearning
      t.string :evaluation
      t.references :domain

      t.timestamps
    end
  end
end
