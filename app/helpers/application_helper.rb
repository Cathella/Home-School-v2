module ApplicationHelper
  
  def member_or_not_member_btn(group)
    member = Member.find_by(group: group, child: current_child)
    if member
      button_to('Leave Group', group_member_path(id: member.id, group_id: group.id), method: :delete, class: "bg-info text-white border-0 mt-3 px-5 shadow very-rounded py-3")
    else
      button_to('Join Group', group_members_path(group_id: group.id), method: :post, class: "bg-yellow text-label border-0 mt-3 px-5 shadow very-rounded py-3")
    end
  end
end
