class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
    Post.create!(post_params)
  end

  def unlock
    Post.unlock(params[:number_to_unlock].to_i)
    redirect_to 'posts/index'
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end
end
