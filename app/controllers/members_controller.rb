class MembersController < ApplicationController
  
  def create
    @member = current_child.members.new(group_id: params[:group_id])

    if @member.save
      redirect_to dashboard_path, notice: "You have joined this group."
    else
      redirect_to dashboard_path, notice: "You cannot join this group!"
    end
  end

  def destroy
    member = Member.find_by(id: params[:id], child: current_child, group_id: params[:group_id])

    if member
      member.destroy
      redirect_to dashboard_path, notice: "You are nolonger part of this group"
    else
      redirect_to dashboard_path, notice: "You are already a member of this group"
    end
  end
end