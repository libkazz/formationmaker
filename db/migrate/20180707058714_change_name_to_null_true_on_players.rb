class ChangeNameToNullTrueOnPlayers < ActiveRecord::Migration[5.2]
  def change
    change_column_null :players, :name, true
    change_column_null :players, :title, true
  end
end
