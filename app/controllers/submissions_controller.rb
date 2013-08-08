class SubmissionsController < ApplicationController
  def index

  end

  def show

  end

  def edit
  end

  def new
    @assignment = Assignment.find(params[:assignment_id])
    @submission = @assignment.submissions.new
    @assignment.write
    @assignment.transactions.create(transaction_type: "write", writer_id: @assignment.user_id)       
  end

  def create
    @submission = current_user.submissions.build(params[:id])
      if submission.save
    flash[:notice] = "Submission was saved."
    redirect_to user_path
  else
    flash[:error] = "There was an error saving the submission. Please try again."
    render :new
  end

  end
end
