# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  body       :text(65535)      not null
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_notes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Note, type: :model do
  it "is valid with proper title and body" do
    note = build(:note)
    expect(note).to be_valid
  end

  it "is invalid without title" do
    note = build(:note, title: nil)
    note.valid?
    expect(note.errors.full_messages).to include("Titleを入力してください")
  end

  it "is invalid without body" do
    note = build(:note, body: nil)
    note.valid?
    expect(note.errors.full_messages).to include("Bodyを入力してください")
  end

  it "is invalid with too long title" do
    note = build(:note, title: "a" * 31)
    note.valid?
    expect(note.errors.full_messages).to include("Titleは30文字以内で入力してください")
  end

  it "is invalid with too long body" do
    note = build(:note, body: "a" * 2001)
    note.valid?
    expect(note.errors.full_messages).to include("Bodyは2000文字以内で入力してください")
  end
end
