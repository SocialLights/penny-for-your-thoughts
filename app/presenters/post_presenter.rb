class PostPresenter

  def all_posts
    Post.all
  end

  def locked_post_count
    Post.where(is_locked: true).count
  end

  def unlocked_post_count
    Post.where(is_locked: false).count
  end
end