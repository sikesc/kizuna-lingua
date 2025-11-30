class GenerateTopicJob < ApplicationJob
  queue_as :default

  def perform(user, topic_title)
    TopicGenerationService.call(user, topic_title)
  end
end
