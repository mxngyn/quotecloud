class Quote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :category
  belongs_to :submitter, class_name: "User"
  has_many :likers, foreign_key: :liker_id, class_name: "Like"

  def likers
    Like.where(quote_id: self.id)
  end
end
