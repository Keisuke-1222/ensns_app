class CreateFavoriteBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :favorite_boards do |t|
      t.integer :user_id, null: false
      t.integer :board_id, null: false

      t.timestamps
    end
    add_index :favorite_boards, :user_id
    add_index :favorite_boards, :board_id
  end
end
