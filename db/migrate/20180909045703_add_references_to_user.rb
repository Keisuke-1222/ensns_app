class AddReferencesToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :note, index: true, foreign_key: true
  end
end
