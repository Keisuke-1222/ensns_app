require 'rails_helper'

describe 'ユーザー一覧機能', type: :system do
  let!(:user1) { create(:user) }
  let!(:user2) { create(:user) }

  before do
    visit users_path
  end

  it 'ユーザー一覧が表示される' do
    expect(page).to have_content user1.name
    expect(page).to have_content user1.profile
    expect(page).to have_content user2.name
    expect(page).to have_content user2.profile
  end
end
