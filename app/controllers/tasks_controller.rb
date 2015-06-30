class TasksController < ApplicationController
	def index
		@tasks = Task.paginate(page: params[:page])
 	end
 	def show
    	@task = Task.find(params[:id])
    end
end
