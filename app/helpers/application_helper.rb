module ApplicationHelper
  
  def member_or_not_member_btn(group)
    member = Member.find_by(group: group, child: current_child)
    if member
      button_to('Leave Group', group_member_path(id: member.id, group_id: group.id), method: :delete)
    else
      button_to('Join Group', group_members_path(group_id: group.id), method: :post)
    end
  end
end
