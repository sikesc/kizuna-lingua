class GrammarPoint < ApplicationRecord
  has_many :topics, through: :topic_grammar_points
end
