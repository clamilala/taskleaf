class ChangeTasksNameNotNull < ActiveRecord::Migration[6.0]
  def change
    #change_column_null→既存テーブルの既存カラムに対し、NOT NULL制約の付け外しを行う
    change_column_null :tasks, :name, false
  end
end
