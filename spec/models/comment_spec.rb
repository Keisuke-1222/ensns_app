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
