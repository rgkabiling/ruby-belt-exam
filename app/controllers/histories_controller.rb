class HistoriesController < ApplicationController
  def create
    if session[:amount_raised] == nil
      session[:amount_raised] = 0
    end
    lender = Lender.find(session[:lender_id])
    borrower = Borrower.find(params[:id])
    history = History.new(lender: current_lender, borrower: borrower, amount: params[:amount])
      if history.save
        session[:amount_raised] = session[:amount_raised].to_i + History.last.amount
        Borrower.find(params[:id]).update(raised: session[:amount_raised])
        if borrower.save
          redirect_to "/lender/#{lender.id}"
        else
          flash[:errors] = history.errors.full_messages
          redirect_to "/lender/#{lender.id}"
        end
      end
  end
end
