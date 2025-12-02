class NotificationsController < ApplicationController
  def show
    @notification = Noticed::Notification.find(params[:id])
    authorize @notification, policy_class: NotificationPolicy
    @notification.mark_as_read!

    # Redirect to the journal associated with the notification
    journal = @notification.params[:journal]
    redirect_to partnership_journal_path(journal.partnership, journal)
  end
end

