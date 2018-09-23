require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with name, email, and password" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "is invalid without name" do
    user = build(:user, name: nil)
    user.valid?
    expect(user.errors.full_messages).to include("Nameを入力してください")
  end

  it "is invalid without email" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors.full_messages).to include("Eメールを入力してください")
  end

  it "is invalid without password" do
    user = build(:user, password: nil)
    user.valid?
    expect(user.errors.full_messages).to include("パスワードを入力してください")
  end

  it "is invalid with too short password" do
    user = build(:user, password: "aaaaa")
    user.valid?
    expect(user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
  end
end
