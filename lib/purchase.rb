class Purchase < ActiveRecord::Base
  belongs_to :item
  has_one :price, through: :item
end
