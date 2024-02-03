class InvitationsController < ApplicationController
  def index
    @invitations = Invitation.all
  end

  def accept_invitation(current_user_id, invitation)
    current_user = User.find_by_id(current_user_id)
    current_user.accept_invitation(invitation)
  end
  helper_method :accept_invitation

  def reject_invitation(current_user_id, invitation)
    current_user = User.find_by_id(current_user_id)
    current_user.reject_invitation(invitation)
  end
  helper_method :reject_invitation
end
