class CommentsController < ApplicationController
  def new
  	@comment = Comment.new
    @comment.task_id =params[:task_id]    
  end

  def create
  	@comment = Comment.new(comment_params)
  	@comment.user_id =current_user.id
    if @comment.save       
      flash[:info] = "Comment added."
      redirect_to Task.find(@comment.task_id)
    else
      render 'new'
    end
  end
  private
    def comment_params
      params.require(:comment).permit(:comment, :task_id)
    end
end
