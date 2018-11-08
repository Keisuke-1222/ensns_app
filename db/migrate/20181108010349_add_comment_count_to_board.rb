class AddCommentCountToBoard < ActiveRecord::Migration[5.0]
  def change
    add_column :boards, :comments_count, :integer, default: 0
  end
end
