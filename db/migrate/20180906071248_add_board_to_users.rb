class AddBoardToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :board, index: true, foreign_key: true
  end
end
