# To deliver this notification:
#
# JournalFeedbackNotificationNotifier.with(record: @post, message: "New post").deliver(User.all)

class JournalFeedbackNotification < ApplicationNotifier
  required_param :journal

  recipients do
    params[:journal].user
  end

end
