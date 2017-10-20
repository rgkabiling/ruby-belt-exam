class LendersController < ApplicationController
  def create
    lender = Lender.new(lender_params)

    if lender.save
      redirect_to '/login'
    else
      flash[:errors] = lender.errors.full_messages
      redirect_to :back
    end
  end
  def show
    @lender = Lender.find(params[:id])
    @borrowers = Borrower.all
    @monies = monies
    @histories = @histories = History.where(lender_id:session[:lender_id])
  end
  def monies
    [
      100, 200, 300, 400, 500, 600, 700, 800, 900, 1000
    ]
  end
  private
    def lender_params
      params.require(:lender).permit(:first_name, :last_name, :email, :money, :password, :password_confirmation)
    end
end
