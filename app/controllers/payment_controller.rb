class PaymentController < ApplicationController
  before_filter :login_required
  
  def new
    @payment = Payment.new
  end
  
  
  def create
    ok = false
    params.each { |key, val|
      if (key.to_i > 0) #If the payment is standing order (.to_i will return 0 for all non numeric values of key)
        logger.debug "Cadet ID #{key.to_i} is paying #{val.to_f}by SO today."
        @payment = Payment.new
        @payment.cadet_id = key.to_i
        @payment.ammount = val.to_f
        @payment.date = DateTime.now
        @cadet = Cadet.find(@payment.cadet_id)
        @cadet.balance += @payment.ammount
        ok = true if @cadet.save && @payment.save
      end  
      if (key[0..1].to_s == "oa" && val != "") #if first two letters are "oa" and the key isn't blank...
        logger.debug "Cadet ID #{key[3..-1].to_i} is paying #{val.to_f} by cash/cheque today."
        @payment = Payment.new
        @payment.cadet_id = key[3..-1].to_i #Take the first 3 characters off and change to int
        @payment.ammount = val.to_f
        @payment.date = DateTime.now
        @payment.save!
        @cadet = Cadet.find(@payment.cadet_id)
        @cadet.balance += @payment.ammount
        ok = true if @cadet.save && @payment.save
      end 
    }
    
    ok ? flash[:notice] = "Successfully recorded payments." : flash[:error] = "Payments Failed. These has been an error."
    redirect_to root_url 
  end

end
