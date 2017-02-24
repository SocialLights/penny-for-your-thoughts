class Post < ApplicationRecord

  scope :locked, -> (number_of_posts) { where(is_locked: true).order(:created_at).first(number_of_posts) }

  def class_name
    self.is_locked ? "locked" : "unlocked"
  end

  def self.unlock(number_of_posts)
    locked_posts = Post.locked(number_of_posts)

    locked_posts.each do |post|
      post.is_locked = false
      post.save
    end
  end

end
