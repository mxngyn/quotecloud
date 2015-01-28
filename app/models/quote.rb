class Quote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :category
  belongs_to :submitter, class_name: "User"
  has_many :likers, through: :likes, source: :user
end
