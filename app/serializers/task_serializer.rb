class TaskSerializer < ActiveModel::Serializer
   attributes :id, :title, :description, :due_date, :status, :assigned

   def assigned
   		assignee = User.find_by(id: :assigned_user) if :assigned_user
   		return assignee
   end
end