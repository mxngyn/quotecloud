class User < ActiveRecord::Base
  has_secure_password
  # Remember to create a migration!

  has_many :submitted_quotes, class_name: "Quote", foreign_key: :submitter_id
  has_many :liked_quotes, class_name: "Like", foreign_key: :liker_id

  validates :name, presence: true
  validates :email, format: {with: /[a-zA-Z]*[1-9]*@[a-z]*.[a-z]{3}/}
  validates :email, :presence => {:message => "Please provide email"}
  validates :email, :uniqueness => {:message => "Sorry, that email is already taken"}


  def may_delete?(quote)
    quote.submitter_id == self.id
  end
end
