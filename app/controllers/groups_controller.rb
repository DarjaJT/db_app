class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
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



end
