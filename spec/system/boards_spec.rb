require 'rails_helper'

describe '掲示板一覧機能', type: :system do
  let! (:first_board) { create(:board, created_at: 3.hours.ago) }
  let! (:second_board) { create(:board, created_at: 2.hours.ago) }
  let! (:third_board) { create(:board, created_at: 1.hours.ago) }

  before do
    visit boards_path
  end

  it '掲示板一覧が表示される' do
    # 掲示板一覧が新着順に表示されることを確認
    expect(page).to have_content first_board.title
    expect(page).to have_content second_board.title
    expect(page).to have_content third_board.title
  end
end
