class Item < ActiveRecord::Base
  belongs_to :merchant
  validates :description, :price, :presence=>true
end
