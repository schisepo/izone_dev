class TasksController < ApplicationController
	def index
		@tasks = Task.paginate(page: params[:page])
 	end
 	def show
    	@task = Task.find(params[:id])
    end
    def new
	    @task = Task.new
	    @task.organisation_id =params[:organisation_id]
	    @task.user_id = current_user.id

 	end
 	def create
	    @task = Task.new(task_params)
	    @task.status = 1
	    if @task.save	       	      
	      redirect_to Organisation.find(@task.organisation_id)
	    else
	      render 'new'
	    end
  	end

  	def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      # Handle a succes sful update.
      flash[:success] = "task updated"
      redirect_to @task

    else
    #  render 'edit'
    end
  end

  	private

    def task_params
      params.require(:task).permit(:content, :user_id,:organisation_id,:status)
    end
end
