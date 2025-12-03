class TranscribeAudioJob < ApplicationJob
  queue_as :default

  def perform(audio_blob_id, record_type, record_id)
    blob = ActiveStorage::Blob.find(audio_blob_id)
    result = TranscriptionService.call(blob)

    if result[:success]
      record = record_type.constantize.find(record_id)
      record.update!(transcript: result[:transcript])

      # TODO: Add Turbo Stream broadcast when frontend is ready
      # Something like this:
      # Turbo::StreamsChannel.broadcast_replace_to(
      #   "transcription_#{record_type.downcase}_#{record_id}",
      #   target: "transcript-content",
      #   partial: "shared/transcript",
      #   locals: { transcript: result[:transcript] }
      # )
    else
      Rails.logger.error("Transcription failed for #{record_type}##{record_id}: #{result[:error]}")
    end
  end
end
