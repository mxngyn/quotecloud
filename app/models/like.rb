class Like < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :liker, class_name: "User"
  belongs_to :quote

  def quote_author
    quote = Quote.find(self.quote_id)
    quote.author
  end

  def quote_content
    quote = Quote.find(self.quote_id)
    quote.content
  end

  def liker_name
    liker = User.find(self.liker_id)
    liker.name
  end

end
