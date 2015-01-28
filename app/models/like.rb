class Like < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :liker, class_name: "User"
  belongs_to :quotes
end
