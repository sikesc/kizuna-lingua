class NotificationPolicy < ApplicationPolicy
  def show?
    # A user can only see a notification if they are the recipient.
    user == record.recipient
  end

  class Scope < Scope
    def resolve
      # Users can only see their own notifications.
      scope.where(recipient: user)
    end
  end
end
