class RemoveNameFromBoards < ActiveRecord::Migration[5.0]
  def change
    remove_column :boards, :name, :string
  end
end
