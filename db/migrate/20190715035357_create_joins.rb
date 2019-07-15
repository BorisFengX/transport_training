class CreateJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :joins do |t|
      t.integer :target_level
      t.integer :real_level
      t.integer :self_evaluate_level
      t.references :user
      t.references :competency
      t.timestamps
    end
  end
end
