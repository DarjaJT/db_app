class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      flash[:success] = "Group added!"
      redirect_to groups_all_url
    else
      render 'new'
    end
  end

  def destroy
    Group.find(params[:id]).destroy
    flash[:success] = "Group deleted."
    redirect_to groups_all_url
  end


  private

    def group_params # parameters are required
      params.require(:group).permit(:name)
    end

    def correct_user
      @group = current_user.groups.find_by(id: params[:id])
      redirect_to groups_all_url, notice: "Something went wrong."if @group.nil?
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end



end
