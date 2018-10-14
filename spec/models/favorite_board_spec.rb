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

require 'rails_helper'

RSpec.describe FavoriteBoard, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
