class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  belongs_to :parent, optional: true, class_name: "Comment"

  acts_as_favoritable

  def comments
    Comment.where(commentable: commentable, parent_id: self.id)
  end
end
