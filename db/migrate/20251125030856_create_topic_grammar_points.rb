class CreateTopicGrammarPoints < ActiveRecord::Migration[7.1]
  def change
    create_table :topic_grammar_points do |t|
      t.references :topic, null: false, foreign_key: true
      t.references :grammar_point, null: false, foreign_key: true

      t.timestamps
    end
  end
end
