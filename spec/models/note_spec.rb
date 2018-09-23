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
    note = @user.notes.new(
      title: "test title",
      body: "test body"
    )
    expect(note).to be_valid
  end

  it "is invalid without title" do
    note = @user.notes.new(title: nil)
    note.valid?
    expect(note.errors.full_messages).to include("Titleを入力してください")
  end

  it "is invalid without body" do
    note = @user.notes.new(body: nil)
    note.valid?
    expect(note.errors.full_messages).to include("Bodyを入力してください")
  end

  it "is invalid with too long title" do
    note = @user.notes.new(
      title: "a" * 31
    )
    note.valid?
    expect(note.errors.full_messages).to include("Titleは30文字以内で入力してください")
  end

  it "is invalid with too long body" do
    note = @user.notes.new(
      body: "a" * 2001
    )
    note.valid?
    expect(note.errors.full_messages).to include("Bodyは2000文字以内で入力してください")
  end
end
