# To deliver this notification:
#
# JournalReminderNotificationNotifier.with(record: @post, message: "New post").deliver(User.all)

class JournalReminderNotification < ApplicationNotifier
  required_param :journal

  recipients do
    # The recipient is the partner of the user who sent the reminder
    params[:journal].user.partner
  end

end
