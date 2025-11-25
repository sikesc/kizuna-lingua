class PartnershipTopic < ApplicationRecord
  belongs_to :partnership
  belongs_to :topic
end
