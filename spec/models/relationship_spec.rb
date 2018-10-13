# == Schema Information
#
# Table name: relationships
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  followed_id :integer
#  follower_id :integer
#
# Indexes
#
#  index_relationships_on_followed_id                  (followed_id)
#  index_relationships_on_follower_id                  (follower_id)
#  index_relationships_on_follower_id_and_followed_id  (follower_id,followed_id) UNIQUE
#

require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:user_1) { create(:user) }
  let(:user_2) { create(:user) }

  before do
    @relationship = Relationship.new(follower_id: user_1.id, followed_id: user_2.id)
  end

  it "is valid with follower_id and followed_id" do
    expect(@relationship).to be_valid
  end

  it "is invalid without follower_id" do
    @relationship[:follower_id] = nil
    expect(@relationship).not_to be_valid
  end

  it "is invalid without followed_id" do
    @relationship[:followed_id] = nil
    expect(@relationship).not_to be_valid
  end

  describe "user follow" do
    let(:alice) { create(:user) }
    let(:bob) { create(:user) }

    it "follow and unfollow" do
      expect(alice.following?(bob)).to be_falsey
      alice.follow(bob)
      expect(alice.following?(bob)).to be_truthy
      expect(bob.followers?(alice)).to be_truthy
      alice.unfollow(bob)
      expect(alice.following?(bob)).to be_falsey
    end
  end
end
