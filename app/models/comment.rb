class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :body, type: String
  field :commenter, type: String

  embedded_in :post

  def date_added
  	self.created_at.localtime.strftime("%-m/%-d/%Y | %l:%M %p")
  end

end
