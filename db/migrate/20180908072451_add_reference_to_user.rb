class AddReferenceToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :comment, index: true, foreign_key: true
  end
end
