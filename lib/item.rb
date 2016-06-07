class Item < ActiveRecord::Base

  def price
    self[:price].to_f
  end

end
