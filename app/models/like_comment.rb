# == Schema Information
#
# Table name: like_comments
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comment_id :string(255)      not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_like_comments_on_comment_id              (comment_id)
#  index_like_comments_on_user_id                 (user_id)
#  index_like_comments_on_user_id_and_comment_id  (user_id,comment_id) UNIQUE
#

class LikeComment < ApplicationRecord
  belongs_to :user
  belongs_to :comment, counter_cache: :likes_count
  validates :user_id, presence: true
  validates :comment_id, presence: true
end
