class Journal < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  belongs_to :partnership
end
