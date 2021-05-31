module API
  module V1
    class Tasks < Grape::API
      include API::V1::Defaults
      resource :tasks do
       desc "Filter tasks by category"
        get "filter", :TaskSerializer do
          filter = params[:filter]
          if filter == "today"
            puts "yep"
            paginate Task.where(status: 0).where(due_date:Date.today)
          elsif filter == "mine"
            puts "mine"
            paginate Task.where(status: 0).where(assigned: 1)
          else
            puts "yikes"
            paginate Task.where(status: 0)
          end
        end
        desc "Return all tasks"
        paginate per_page: 8
        get "" do
          puts "nope"
          paginate Task.where(status: 0)
        end
      desc "Return a task"
        params do
          requires :id, type: String, desc: "ID of the task"
        end
        get ":id" do
          paginate Task.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end