class AddNameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :native_language, :string
    add_column :users, :learning_language, :string
    add_column :users, :learning_level, :string
  end
end
