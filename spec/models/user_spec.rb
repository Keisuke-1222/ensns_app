# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  admin_flg              :boolean
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  image                  :string(255)
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(255)
#  name                   :string(255)
#  profile                :string(255)
#  provider               :string(255)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  sign_in_count          :integer          default(0), not null
#  uid                    :string(255)
#  unconfirmed_email      :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  board_id               :integer
#  comment_id             :integer
#  note_id                :integer
#
# Indexes
#
#  index_users_on_board_id              (board_id)
#  index_users_on_comment_id            (comment_id)
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_name                  (name) UNIQUE
#  index_users_on_note_id               (note_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#  fk_rails_...  (comment_id => comments.id)
#  fk_rails_...  (note_id => notes.id)
#

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

  it "it invalid with too long name" do
    user = build(:user, name: "a" * 31)
    user.valid?
    expect(user.errors.full_messages).to include("Nameは30文字以内で入力してください")
  end
end
