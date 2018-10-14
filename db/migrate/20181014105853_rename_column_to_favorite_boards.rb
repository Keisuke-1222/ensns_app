class RenameColumnToFavoriteBoards < ActiveRecord::Migration[5.0]
  def change
    rename_column :favorite_boards, :users_id, :user_id
    rename_column :favorite_boards, :boards_id, :board_id
  end
end
