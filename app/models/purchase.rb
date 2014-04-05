class Purchase < ActiveRecord::Base
  belongs_to :purchaser
  belongs_to :item
  belongs_to :merchant
  
  
  validates :name, uniqueness: true, presence: true
end
