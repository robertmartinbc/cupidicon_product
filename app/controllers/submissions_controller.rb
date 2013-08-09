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
    @assignment = Assignment.find(params[:assignment_id])
<<<<<<< HEAD
    @submission = current_user.submissions.new(assignment_id: @assignment)
    @submission.save
      if @submission.save
       if @assignment.authorization
         @assignment.transactions.create(transaction_type: "authorize", writer_id: @assignment.user_id)
         flash[:notice] = "Assignment was submited for review by client."
         redirect_to :root
       else
         flash[:error] = "There was an error saving the submission. Please try again."
         render :new
       end
     else
       flash[:error] = "There was an error saving the submission. Please try again."
       render :new
     end
=======
    @submission = current_user.submissions.new(assignment_id: @assignment.id)
    @submission.save
    
    if @submission.save
      if @assignment.authorization
        @assignment.transactions.create(transaction_type: "authorize", writer_id: @assignment.user_id)
        flash[:notice] = "Assignment was submited for review by client."
        redirect_to :root
      else
        flash[:error] = "There was an error saving the submission. Please try again."
        render :new
      end
    else
      flash[:error] = "There was an error saving the submission. Please try again."
      render :new
    end
>>>>>>> c08873ac1e7772f51c882c5b4a9ef5e53c96c2af
  end
end
