# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  body       :text(65535)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Board, type: :model do
  it "is valid with title and body" do
    board = build(:board)
    expect(board).to be_valid
  end

  it "is invalid without title" do
    board = build(:board, title: nil)
    board.valid?
    expect(board.errors.full_messages).to include("タイトルを入力してください")
  end

  it "is invalid without body" do
    board = build(:board, body: nil)
    board.valid?
    expect(board.errors.full_messages).to include("本文を入力してください")
  end

  it "is invalid with too long title" do
    board = build(:board, title: "a" * 31)
    board.valid?
    expect(board.errors.full_messages).to include("タイトルは30文字以内で入力してください")
  end

  it "is invalid with too long body" do
    board = build(:board, body: "a" * 1001)
    board.valid?
    expect(board.errors.full_messages).to include("本文は1000文字以内で入力してください")
  end
end
