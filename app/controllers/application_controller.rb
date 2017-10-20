class ApplicationController < ActionController::Base
  def current_lender
    Lender.find(session[:lender_id]) if session[:lender_id]
  end

  def current_borrower
    Borrower.find(session[:borrower_id]) if session[:borrower_id]
  end

  helper_method :current_lender
  helper_method :current_borrower
  protect_from_forgery with: :exception
end
