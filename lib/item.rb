class Item < ActiveRecord::Base

  has_many :purchases

  def price
    self[:price].to_f
  end

end
