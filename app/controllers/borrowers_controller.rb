class BorrowersController < ApplicationController
  def create
    @borrower = Borrower.new(borrower_params)

    if @borrower.save
      redirect_to '/login'
    else
      flash[:errors] = @borrower.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @borrower = Borrower.find(session[:borrower_id])
    @lenders = Lender.all

  end

  private
    def borrower_params
      params.require(:borrower).permit(:first_name, :last_name, :email, :purpose, :description, :money, :password, :password_confirmation)
    end


end
