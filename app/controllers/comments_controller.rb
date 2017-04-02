class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.job_id = params[:job_id]
    @job = @comment.job
    if @comment.save
      redirect_to company_job_path(@job.company, @job)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
