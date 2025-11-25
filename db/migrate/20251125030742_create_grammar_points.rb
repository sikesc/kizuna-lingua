class CreateGrammarPoints < ActiveRecord::Migration[7.1]
  def change
    create_table :grammar_points do |t|
      t.string :title
      t.string :level
      t.text :explanation
      t.text :examples
      t.string :language

      t.timestamps
    end
  end
end
