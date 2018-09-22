require 'rails_helper'

RSpec.describe Note, type: :model do
  before do
    @user = User.create(
      name: "test user",
      email: "test@example.com",
      password: "password"
    )
  end

  it "is valid with proper title and body" do
    note = @user.notes.create(
      title: "test title",
      body: "test body"
    )

    expect(note).to be_valid
  end

  it "is invalid without title" do
    note = @user.notes.create(title: nil)

    expect(note.errors.full_messages).to include("Titleを入力してください")
  end

  it "is invalid without body" do
    note = @user.notes.create(body: nil)

    expect(note.errors.full_messages).to include("Bodyを入力してください")
  end

  it "is invalid with too long title" do
    note = @user.notes.create(
      title: "a" * 31
    )

    expect(note.errors.full_messages).to include("Titleは30文字以内で入力してください")
  end

  it "is invalid with too long body" do
    note = @user.notes.create(
      body: "a" * 2001
    )

    expect(note.errors.full_messages).to include("Bodyは2000文字以内で入力してください")
  end
end
