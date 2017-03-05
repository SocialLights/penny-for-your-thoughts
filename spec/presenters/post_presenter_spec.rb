require 'rails_helper'

describe PostPresenter do

  it 'returns all posts' do
    post = Post.create(text: 'Post 1')

    expect(described_class.new.all_posts).to eq([post])
  end

  it 'returns the number of locked posts' do
    Post.create(text: 'Post 1')
    Post.create(text: 'Post 2')

    expect(described_class.new.locked_post_count).to eq(2)
  end

  it 'returns the number of unlocked posts' do
    Post.create(is_locked: false, text: 'Post 1')
    Post.create(is_locked: false, text: 'Post 2')

    expect(described_class.new.unlocked_post_count).to eq(2)
  end
end