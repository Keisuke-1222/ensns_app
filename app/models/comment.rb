# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  comment     :text(65535)      not null
#  likes_count :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  board_id    :integer
#  user_id     :integer
#
# Indexes
#
#  index_comments_on_board_id  (board_id)
#  index_comments_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (board_id => boards.id)
#  fk_rails_...  (user_id => users.id)
#

class Comment < ApplicationRecord
  belongs_to :board
  belongs_to :user
  has_many :like_comments, dependent: :destroy
  has_many :like_users, through: :like_comments, source: :user

  validates :comment, presence: true, length: { maximum: 1000 }

  def like(user)
    like_comments.create(user_id: user.id)
  end

  def unlike(user)
    like_comments.find_by(user_id: user.id).destroy
  end

  def like?(user)
    like_users.include?(user)
  end
end
