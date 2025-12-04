class GenerateTopicJob < ApplicationJob
  queue_as :default

  def perform(user, topic_title)
    result = TopicGenerationService.call(user, topic_title)
    if result[:success]
      topic = result[:topic]

      content_to_display = if user.learning_language == "japanese"
                              topic.content["eng"]
                            else
                              topic.content["jpn"]
                            end

      # Broadcast the topic card to the grid
      Turbo::StreamsChannel.broadcast_prepend_to(
        "topics",
        target: "topics-list",
        partial: "topics/topic_card",
        locals: { topic: topic, topic_status: "not started" }
      )

      # Broadcast the modal (appended to body so it's accessible)
      Turbo::StreamsChannel.broadcast_append_to(
        "topics",
        target: "topic-modals",
        partial: "topics/topic",
        locals: {
          topic: topic,
          content_to_display: content_to_display,
          partnership_topic: PartnershipTopic.new,
          topic_status: "not started"
        }
      )
    end
  end
end
