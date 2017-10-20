class UsersController < ApplicationController
  def index
    @monies = monies
  end
  def new
    @monies = monies
  end
  def monies
    [
      100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1100, 1200, 1300, 1400, 1500, 1600, 1700, 1800, 1900, 2000, 3000, 5000
    ]
  end
end
