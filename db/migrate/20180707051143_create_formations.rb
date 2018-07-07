class CreateFormations < ActiveRecord::Migration[5.2]
  def change
    create_table :formations do |t|
      t.string :name, null: false
      t.text :positions

      t.timestamps
    end
  end
end
