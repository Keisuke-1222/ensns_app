require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = User.create(
      name: "test user",
      email: "test@example.com",
      password: "password"
    )

    @board = @user.boards.new(
      title: "test title",
      body: "test body"
    )
  end

  it "is valid with comment" do
    comment = @board.comments.new(
      comment: "test comment",
      user_id: @user.id
    )
    expect(comment).to be_valid
  end

  it "is invalid without comment" do
    comment = @board.comments.new(
      comment: "",
      user_id: @user.id
    )
    comment.valid?
    expect(comment.errors.full_messages).to include("コメントを入力してください")
  end

  it "is invalid with too long comment" do
    comment = @board.comments.new(
      comment: "a" * 1001,
      user_id: @user.id
    )
    comment.valid?
    expect(comment.errors.full_messages).to include("コメントは1000文字以内で入力してください")
  end
end
