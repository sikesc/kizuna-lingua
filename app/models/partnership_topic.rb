class PartnershipTopic < ApplicationRecord
  belongs_to :partnership
  belongs_to :topic

  after_create :generate_status

  def generate_status
    self.status = "in progress"
  end
end
