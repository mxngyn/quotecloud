class Like < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :liker, class_name: "User"
  belongs_to :quotes
  has_many :liked_quotes, class_name: "Quote", foreign_key: :liked_id

  def quote_author
    quote = Quote.find(self.quote_id)
    quote.author
  end

  def quote_content
    quote = Quote.find(self.quote_id)
    quote.content
  end

end
