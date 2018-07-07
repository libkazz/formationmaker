class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.references :team, foreign_key: true, index: true
      t.string :name, null: true
      t.string :number, null: false
      t.string :title, null: true
      t.text :introduction
      t.string :photo

      t.timestamps
    end
  end
end
