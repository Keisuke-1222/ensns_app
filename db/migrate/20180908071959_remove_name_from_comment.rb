class RemoveNameFromComment < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :name, :string
    add_reference :comments, :user, index: true, foreign_key: true
  end
end
