class CreateJournals < ActiveRecord::Migration[7.1]
  def change
    create_table :journals do |t|
      t.text :content
      t.text :feedback
      t.boolean :conversation_status, default: false
      t.references :user, null: false, foreign_key: true
      t.references :challenge, null: false, foreign_key: true
      t.references :partnership, null: false, foreign_key: true

      t.timestamps
    end
  end
end
