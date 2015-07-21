class Summary < ActiveRecord::Base
  belongs_to :post


  def title
    self.post.title
  end
end
