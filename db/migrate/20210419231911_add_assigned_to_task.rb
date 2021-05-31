class AddAssignedToTask < ActiveRecord::Migration[6.0]
  def change
  	add_column :tasks, :assigned_user_id, :integer
  end
end
