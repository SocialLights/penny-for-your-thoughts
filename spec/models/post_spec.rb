require 'rails_helper'

describe Post do

  context '#locked' do
    it 'returns only locked posts' do
      Post.create!(text: "post 1", is_locked: false, created_at: 3.days.ago)
      Post.create!(text: "post 2", created_at: 2.days.ago)
      Post.create!(text: "post 3", created_at: DateTime.now)

      expect(Post.locked(3).count).to eq 2
    end

    it 'returns locked posts up to the specified number' do
      Post.create!(text: "post 1", is_locked: false, created_at: 3.days.ago)
      Post.create!(text: "post 2", created_at: 2.days.ago)
      Post.create!(text: "post 3", created_at: DateTime.now)

      expect(Post.locked(1).count).to eq 1
    end

    it 'returns only the number of available locked number of posts' do
      Post.create!(text: "post 1", is_locked: false, created_at: 3.days.ago)
      Post.create!(text: "post 2", created_at: 2.days.ago)
      Post.create!(text: "post 3", created_at: DateTime.now)

      expect(Post.locked(10).count).to eq 2
    end
  end

  context '#unlock_posts' do
    it 'unlocks the oldest available post first' do
      post_1 = Post.create!(text: "post 1", created_at: 3.days.ago)
      post_2 = Post.create!(text: "post 2", created_at: 2.days.ago)
      post_3 = Post.create!(text: "post 3", created_at: DateTime.now)

      Post.unlock(1)

      expect(post_1.reload.is_locked?).to eq false
      expect(post_2.reload.is_locked?).to eq true
      expect(post_3.reload.is_locked?).to eq true
    end

    it 'succeeds when there are less posts than what was requested' do
      post_1 = Post.create!(text: "post 1", created_at: 3.days.ago)
      post_2 = Post.create!(text: "post 2", created_at: 2.days.ago)
      post_3 = Post.create!(text: "post 3", created_at: DateTime.now)

      Post.unlock(5)

      expect(post_1.reload.is_locked?).to eq false
      expect(post_2.reload.is_locked?).to eq false
      expect(post_3.reload.is_locked?).to eq false
    end
  end

  context '#price' do
    it 'should be a Money object' do
      is_expected.to monetize(:price)
    end
  end
end