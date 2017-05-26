require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  context "#create" do
    it "creates a post" do
      post :create, params: {post: {text: "some text", price_cents: "0.99"}}

      expect(Post.last.text).to eq("some text")
      expect(Post.last.price_cents).to eq(99)
      expect(Post.last.is_locked).to eq(true)
    end

    it "creates a post with correct price" do
      post :create, params: {post: {text: "some text", price_cents: "99.99"}}

      expect(Post.last.text).to eq("some text")
      expect(Post.last.price_cents).to eq(9999)
      expect(Post.last.is_locked).to eq(true)
    end
  end

end
