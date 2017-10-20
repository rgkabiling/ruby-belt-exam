class SessionsController < ApplicationController
  def create
    lender = Lender.find_by(email: params[:email])
    borrower = Borrower.find_by(email: params[:email])

    if lender && lender.authenticate(params[:password])
      session[:lender_id] = lender.id
      redirect_to "/lender/#{lender.id}"
    elsif borrower && borrower.authenticate(params[:password])
      session[:borrower_id] = borrower.id
      redirect_to "/borrower/#{borrower.id}"
    else
      flash[:errors] = ["Invalid Combination"]
      redirect_to :back
    end
  end
  def destroy
    reset_session
    redirect_to :root
  end
end
