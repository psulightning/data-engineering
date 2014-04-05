class Purchaser < ActiveRecord::Base
  has_many :purchases
  
  validates :count, numericality: {only_integer: true,greater_than: 0}
end
