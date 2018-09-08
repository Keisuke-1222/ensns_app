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

require 'test_helper'

class LikeCommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
