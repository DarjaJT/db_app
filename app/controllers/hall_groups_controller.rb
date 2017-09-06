class HallGroupsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def index
    @hall_groups = HallGroup.joins(:hall, :group)
  end

  def new
    @hall_group = HallGroup.new
    @halls = Hall.all
    @groups = Group.all
  end

  def create
    @hall_group = HallGroup.new(hall_group_params)
    if @hall_group.save
      flash[:success] = "Group added to the Hall!"
      redirect_to hall_groups_all_path
    else
      @halls = Hall.all
      @groups = Group.all
      render 'new'
    end
  end

  def destroy
    HallGroup.find(params[:id]).destroy
    flash[:success] = "Group was deleted from the hall."
    redirect_to hall_groups_all_path
  end


  private

    def hall_group_params
      params.require(:hall_group).permit(:hall_id, :group_id)
    end

    def signed_in_user # srequirement to be logged in
      unless signed_in?
        store_location # sessions_helper.rb
        redirect_to signin_url, notice: "Please sign in."
      end
    end



end
