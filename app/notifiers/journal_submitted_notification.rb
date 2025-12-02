# To deliver this notification:
#
# JournalSubmittedNotificationNotifier.with(record: @post, message: "New post").deliver(User.all)

class JournalSubmittedNotification < ApplicationNotifier
  required_param :journal

  recipients do
    # The recipient is the partner of the user who submitted the journal
    params[:journal].user.partner
  end

end
