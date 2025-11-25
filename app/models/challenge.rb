class Challenge < ApplicationRecord
  belongs_to :topic
  has_one :journal
end
