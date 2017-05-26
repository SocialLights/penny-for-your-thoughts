class PostsController < ApplicationController
  def index
    @post_presenter ||= post_presenter
  end

  def create
    permitted_post_params = post_params
    permitted_post_params[:price_cents] = (100 * permitted_post_params[:price_cents].to_r).to_i
    @post = Post.create!(permitted_post_params)
    respond_to do |format|
      if @post.save
        format.html {redirect_to root_path}
        format.js
      else
        format.html {redirect_to root_path}
      end
    end
  end

  def unlock
    Post.unlock(params[:number_to_unlock].to_i)
    redirect_to 'posts/index'
  end

  private

  def post_presenter
    PostPresenter.new
  end

  def post_params
    @post_params ||= params.require(:post).permit(:text, :price_cents)
  end
end
