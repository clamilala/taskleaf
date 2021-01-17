class ChangeTasksNameLimit30 < ActiveRecord::Migration[6.0]
  #Taskモデル name に30文字の制限を加える
  def up
    change_column :tasks, :name, :string, limit: 30
  end
  def down
    change_column :tasks, :name, :string
  end
end
