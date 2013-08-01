class AssignmentsController < ApplicationController
  def index
    @assignments = Assignment.all
  end

  def show
    @assignment = Assignment.find(params[:id])
  end

  def new
    @assignment = Assignment.new
  end

  def create
  @assignment = current_user.assignments.build(params[:assignment])
  if @assignment.save
    flash[:notice] = "Assignment was saved."
    redirect_to @assignment
  else
    flash[:error] = "There was an error saving the assignment. Please try again."
    render :new
  end
end

  def edit
    @assignment = Assignment.find(params[:id])
  end

  def update
    @assignment = Assignment.find(params[:id])
    if @assignment.update_attributes(params[:post])
      flash[:notice] = "Assignment was updated."
      redirect_to @assignment
    else
      flash[:error] = "There was an error saving the assignment. Please try again."
      render :new
    end
  end
end
