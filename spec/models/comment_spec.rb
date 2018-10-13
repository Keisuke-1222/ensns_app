# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  comment     :text(65535)      not null
#  likes_count :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  board_id    :integer
#  user_id     :integer
#
# Indexes
#
#  index_comments_on_board_id  (board_id)
#  index_comments_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "is valid with comment" do
    comment = build(:comment)
    expect(comment).to be_valid
  end

  it "is invalid without comment" do
    comment = build(:comment, comment: nil)
    comment.valid?
    expect(comment.errors.full_messages).to include("コメントを入力してください")
  end

  it "is invalid with too long comment" do
    comment = build(:comment, comment: "a" * 1001)
    comment.valid?
    expect(comment.errors.full_messages).to include("コメントは1000文字以内で入力してください")
  end
end
