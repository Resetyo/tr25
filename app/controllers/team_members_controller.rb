class TeamMembersController < ApplicationController
  
  load_and_authorize_resource except: [:new, :edit]

  def new
    @team_member = TeamMember.new
    render :edit
  end

  def create
    @team_member = TeamMember.new(team_member_params)
    @team_member.sort = TeamMember.last.sort + 1
    @team_member.save
    redirect_to admin_path
  end

  def edit
    @team_member = TeamMember.find(params[:id])
  end

  def update
    @team_member = TeamMember.find(params[:id])
    @team_member.update_attributes(team_member_params)
    redirect_to admin_path
  end

  def destroy
    TeamMember.find(params[:id]).destroy
    redirect_to admin_path
  end

  private

    def team_member_params
      params.require(:team_member).permit(:photo, :name, :info, :fb, :vk, :ru_name, :ru_info)
    end
end
