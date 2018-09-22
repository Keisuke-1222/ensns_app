require 'rails_helper'

RSpec.describe Board, type: :model do
  before do
    @user = User.create(
      name: "test user",
      email: "test@gmail.com",
      password: "password"
    )
  end

  it "is valid with title and body" do
    board = @user.boards.new(
      title: "test title",
      body: "test body"
    )
    expect(board).to be_valid
  end

  it "is invalid without title" do
    board = @user.boards.create(title: nil)
    expect(board.errors.full_messages).to include("タイトルを入力してください")
  end

  it "is invalid without body" do
    board = @user.boards.create(body: nil)
    expect(board.errors.full_messages).to include("本文を入力してください")
  end

  it "is invalid with too long title" do
    board = @user.boards.create(title: "a" * 31)
    expect(board.errors.full_messages).to include("タイトルは30文字以内で入力してください")
  end

  it "is invalid with too long body" do
    board = @user.boards.create(body: "a" * 1001)
    expect(board.errors.full_messages).to include("本文は1000文字以内で入力してください")
  end

end
