class Merchant < ActiveRecord::Base
  has_many :items
  has_many :merchant_addresses, :dependent => :destroy
  has_many :addresses, :through=>:merchant_addresses
  
  validates :name, uniqueness: true, presence: true
end
