class Post < ApplicationRecord
  def class_name
    self.is_locked ? "locked" : "unlocked"
  end
end
