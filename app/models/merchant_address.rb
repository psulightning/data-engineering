class MerchantAddress < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :address
end
