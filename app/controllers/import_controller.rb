# Controller to receive uploaded files from user
class ImportController < ApplicationController  
  
  # Receives file from user
  def upload
    if !request.post?
      render status: 406, nothing: true
      return
    end
    if !params[:file]
      render status: 400, nothing: true
      return
    end
    data = File.new(params[:file]).readlines # make array of all lines in file
    data.shift # remove header
    @sum = 0.0
    data.each{|line|
      buyer, descrip, price, quantity, address, merchant = line.split("\t") # split line by Tab
      merchant.gsub!("\n","") # strip off \n
      buyer_obj = Purchaser.find_or_create_by(name: buyer) # find buyer or create if not exist
      address_obj = Address.find_or_create_by(address: address) #find address or create if not exist
      merch_obj = Merchant.find_or_create_by(name: merchant) # find or create; allows for same company, different stores 
      if !merch_obj.addresses.include?(address_obj)
        merch_obj.addresses << address_obj 
        merch_obj.save
      end
      item_obj = Item.find_or_create_by(description: descrip, price: price, merchant: merch_obj) # find or create item if not exist, 
      # allow for same description but different merchant
      
      Purchase.create({:purchaser=>buyer_obj,:item=>item_obj,:count=>quantity, :merchant=>merch_obj})
      @sum += (price.to_f*quantity.to_i)
    }
  end
end
