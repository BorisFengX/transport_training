class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :code
      t.string :name
      t.string :role
      t.string :avatar
      t.references :team

      t.timestamps
    end
  end
end
