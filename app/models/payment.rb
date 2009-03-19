class Payment < ActiveRecord::Base
  
  #Associations
   belongs_to :cadet

   #Validations
   validates_associated :cadet
   
end
