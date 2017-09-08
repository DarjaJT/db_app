class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update , :destroy] # srequirement to be logged in
  before_action :correct_user,   only: [:edit, :update] # requirement of the right user
  before_action :admin_user,     only: :destroy # Access is only open to the administrator

  def index # show all users
    # @users = User.all
    @users = User.paginate(page: params[:page])
  end

  def new # add new user
    @user = User.new
    @user.build_trainer # sends nested attributes to the user
    @user.build_sportsman # sends nested attributes to the user
    @trainer = Trainer.new
    @sportsman = Sportsman.new
  end

  def trainer_add # AJAX
  end

  def sportsman_add # AJAX
    @halls = Hall.all
  end

  def hall_groups_options # AJAX
    #@groups = Hall.find_by_id(params[:hall_id]).groups
    @groups = Group.joins(:halls).where(halls: { id: params[:hall_id] })
  end

  def group_trainers_options # AJAX
    @trainers = Trainer.joins(:groups).where(groups: { id: params[:group_id] })
  end

  def show # show user profile
    @user = User.find(params[:id])
  end

  # def filtered_users
  #   type = params[:type]
  #
  #   case type
  #     when 'trainer'
  #       @users = User.joins(:trainer)
  #     when 'sportsman'
  #       @users = User.join
  #   end
  # end

  def create # registration form processing
    @user = User.new(user_params)
    if @user.save
      sign_in @user # User login after registration.
      flash[:success] = "Welcome to the App!" # temporary messages (application.html.erb)
      redirect_to @user
    else # failure to register
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    @trainer = @user.trainer
    @sportsman = @user.sportsman
  end

  def update
    @user = User.find(params[:id])
    @trainer = @user.trainer
    @sportsman = @user.sportsman
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy # delete user
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end



  private

    def user_params # parameters are required
      params.require(:user).permit(:name, :email, :password, :password_confirmation,
                                    trainer_attributes: [:qualif],
                                    sportsman_attributes: [:address, :group_id, :trainer_id]
      )
    end

    # Before filters

    def signed_in_user # srequirement to be logged in
      unless signed_in?
        store_location # sessions_helper.rb
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user # requirement of the right user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user) # current_user? - sessions_helper.rb
    end

    def admin_user # Access is only open to the administrator
      redirect_to(root_url) unless current_user.admin?
    end

end
