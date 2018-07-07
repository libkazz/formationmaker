class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.references :formation, foreign_key: true, index: true
      t.string :name, null: false
      t.string :key, null: false
      t.string :owner_key, null: false
      t.boolean :published
      t.text :image_cache

      t.timestamps
    end
    add_index :teams, :key, unique: true
  end
end
