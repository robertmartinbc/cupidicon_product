class AssignmentsController < ApplicationController
  def index
    @assignments = Assignment.where(state: 0)
  end

  def show
    @assignment = Assignment.find(params[:id])
    if @assignment.state == 0
      if @assignment.transactions.where(writer_id: @assignment.user_id, transaction_type: "review").length > 2
        flash[:notice] = "You can no longer review this assignment"
        redirect_to assignments_path
      else
         @assignment.review 
        # Change the current user's state
        @assignment.transactions.create(transaction_type: "review", writer_id: @assignment.user_id)
      end
    else
      flash[:notice] = "That assignment is currently being reviewed by another writer"
      redirect_to assignments_path
    end
  end

  def new
    @assignment = Assignment.new
    authorize! :create, Assignment, message: "You need to be a member to create a new assignment."
  end

  def create
  @assignment = current_user.assignments.build(params[:assignment])
  
  authorize! :create, @assignment, message: "You need to be signed up to do that."
  if @assignment.save
    flash[:notice] = "Assignment was saved."
    redirect_to user_path(current_user.id)
  else
    flash[:error] = "There was an error saving the Assignment. Please try again."
    render :new
  end
end

  def edit
    @assignment = Assignment.find(params[:id])
    authorize! :edit, @assignment, message: "You need to own the assignment to edit it."
  end

  def update
    @assignment = Assignment.find(params[:id])
    authorize! :edit, @assignment, message: "You need to own the assignment to edit it."
    if @assignment.update_attributes(params[:assignment])
      flash[:notice] = "Assignment was updated."
      redirect_to @assignment
    else
      flash[:error] = "There was an error saving the Assignment. Please try again."
      render :new
    end
  end

  def renew
    @assignment = Assignment.find(params[:id])
    @assignment.renew
    @assignment.transactions.create(transaction_type: "renew", writer_id: @assignment.user_id)
    redirect_to assignments_path
  end

  def write  
    @assignment = Assignment.find(params[:id])
    @assignment.write
    @assignment.transactions.create(transaction_type: "write", writer_id: @assignment.user_id)        
  end

  def cancel
    @assignment = Assignment.find(params[:id])
    if @assignment.cancel
      @assignment.transactions.create(transaction_type: "cancel", writer_id: @assignment.user_id)
      flash[:notice] = "You can only review this assignment 1 more time."
      redirect_to assignments_path
    else
      flash[:error] = "Something went wrong."
      redirect_to assignments_path
    end
  end


  def authorize
    @assignment = Assignment.find(params[:id])
    @assignment.authorize
    @assignment.transactions.create(transaction_type: "authorize", writer_id: @assignment.user_id)
   
  end
 
  def published
    @assignment = Assignment.find(params[:id])
    @assignment.published
    @assignment.transactions.create(transaction_type: "published", writer_id: @assignment.user_id)
  end

  def reject
    @assignment = Assignment.find(params[:id])
    @assignment.reject
    @assignment.transactions.create(transaction_type: "reject", writer_id: @assignment.user_id)
    redirect_to assignments_path
  end

  def revision
    @assignment = Assignment.find(params[:id])
    @assignment.revision
    @assignment.transactions.create(transaction_type: "revision", writer_id: @assignment.user_id)
  end

  def resubmit
    @assignment = Assignment.find(params[:id])
    @assignment.resubmit
    @assignment.transactions.create(transaction_type: "resubmit", writer_id: @assignment.user_id)
  end

end
