class CreateLikeComments < ActiveRecord::Migration[5.0]
  def change
    create_table :like_comments do |t|
      t.integer :user_id, null: false
      t.string :comment_id, null: false

      t.timestamps

      t.index :user_id
      t.index :comment_id
      t.index [:user_id, :comment_id], unique: true
    end
  end
end
