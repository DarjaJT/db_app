class HallGroupsController < ApplicationController


  def index
    @hall_groups = HallGroup.all
  end

  def new
    @hall_groups = HallGroup.new
    @halls = Hall.all
    @groups = Group.all
  end

  def create

  end



end
