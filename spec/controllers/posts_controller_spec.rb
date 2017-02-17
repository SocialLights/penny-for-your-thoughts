require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  context "#create" do
    it "creates a post" do
      post :create, params: {post: {text: "some text"}}

      expect(Post.last.text).to eq("some text")
      expect(Post.last.is_locked).to eq(true)
    end
  end

end
