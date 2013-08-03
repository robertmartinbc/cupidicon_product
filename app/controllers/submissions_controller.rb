class SubmissionsController < ApplicationController
  def index
  end

  def show

  end

  def edit
  end

  def new
  end

  def create
    @submissions = current_user.submissions.build(params[:submission])
      if submission.save
    flash[:notice] = "Submission was saved."
    redirect_to user_path
  else
    flash[:error] = "There was an error saving the Assignment. Please try again."
    render :new
  end

  end
end
