class Item < ActiveRecord::Base

  has_many :purchases

  def price
    self[:price].to_f
  end

  def to_h
    {
      "id"          => self.id.to_s,
      "description" => self.description,
      "price"       => self.price
    }
  end

  def to_s
    #binding.pry
    [
      id.to_s,
      description.to_s,
      price.to_s
    ]
  end

end
