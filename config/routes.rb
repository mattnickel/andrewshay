Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/aadmin', as: 'rails_admin'
  mount API::Base, at: "/"
	namespace :api do
		namespace :v1 do
			devise_scope :user do
				get "tasks/filter", to: "tasks/filter#get"
				get "tasks", to: "tasks"
			end
		end
	end

 
  devise_for :users
  resources :task_lists
  root to: "welcome#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
