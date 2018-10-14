# == Schema Information
#
# Table name: favorite_boards
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_favorite_boards_on_board_id  (board_id)
#  index_favorite_boards_on_user_id   (user_id)
#

class FavoriteBoard < ApplicationRecord
  belongs_to :user
  belongs_to :board
end
