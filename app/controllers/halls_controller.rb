class HallsController < ApplicationController
  before_action :correct_user,   only: [:destroy]
  before_action :signed_in_user, only: [:create, :destroy]

  def index
    @halls = Hall.all
    # @number = 1
  end

  def new
    @hall = Hall.new
  end

  def create
    @hall = current_user.halls.new(hall_params)
    if @hall.save
      flash[:success] = "Hall added!"
      redirect_to halls_all_url
    else
      render 'new'
    end
  end

  def destroy
    Hall.find(params[:id]).destroy
    flash[:success] = "Hall deleted."
    redirect_to halls_all_url
  end






  private

    def hall_params # parameters are required
      params.require(:hall).permit(:name)
    end

    def correct_user # requirement of the right user
      @hall = Hall.find_by(id: params[:id])
      redirect_to(halls_all_url) if @hall.nil?
    end

    def signed_in_user # srequirement to be logged in
      unless signed_in?
        store_location # sessions_helper.rb
        redirect_to signin_url, notice: "Please sign in."
      end
    end




end
