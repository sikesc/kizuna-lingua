class CreatePartnershipTopics < ActiveRecord::Migration[7.1]
  def change
    create_table :partnership_topics do |t|
      t.references :partnership, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true
      t.string :status, default: "not started"

      t.timestamps
    end
  end
end
