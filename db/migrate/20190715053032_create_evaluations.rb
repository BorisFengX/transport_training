class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.references :join, foreign_key: true
      t.integer :score
      t.integer :level
      t.timestamps
    end
  end
end
