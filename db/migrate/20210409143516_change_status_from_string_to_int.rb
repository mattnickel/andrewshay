class ChangeStatusFromStringToInt < ActiveRecord::Migration[6.0]
  def change
  	remove_column :tasks, :status
  	add_column :tasks, :status, :integer, null: false, default: 0, index: true

  end
end
