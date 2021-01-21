class AddAdminToUsers < ActiveRecord::Migration[6.0]
  def change
    # add_column：カラムを追加
    add_column :users, :admin, :boolean, default: false, null: false
  end
end
