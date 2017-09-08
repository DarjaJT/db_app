class GroupTrainersController < ApplicationController
  def index
    @group_trainers = GroupTrainer.joins(:trainer, :group)
  end

  def new
    @group_trainer = GroupTrainer.new
    @groups = Group.all
    @trainers = Trainer.all
  end

  def create
    @group_trainer = GroupTrainer.new(group_trainer_params)
    if @group_trainer.save
      flash[:success] = "Trainer added to the Group!"
      redirect_to group_trainers_all_path
    else
      @groups = Group.all
      @trainers = Trainer.all
      render 'new'
    end
  end

  def destroy
    GroupTrainer.find(params[:id]).destroy
    flash[:success] = "Trainer was deleted from the group."
    redirect_to group_trainers_all_path
  end

  private

    def group_trainer_params
      params.require(:group_trainer).permit(:trainer_id, :group_id)
    end

    def signed_in_user # srequirement to be logged in
      unless signed_in?
        store_location # sessions_helper.rb
        redirect_to signin_url, notice: "Please sign in."
      end
    end


end
