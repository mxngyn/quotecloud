class User < ActiveRecord::Base
  has_secure_password
  # Remember to create a migration!

  has_many :submitted_quotes, class_name: "Quote", foreign_key: :submitter_id
  has_many :liked_quotes, class_name: "Like", foreign_key: :liker_id

end
