class CreateChallenges < ActiveRecord::Migration[7.1]
  def change
    create_table :challenges do |t|
      t.jsonb :content, default: {}
      t.jsonb :conversation, default: {}
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
