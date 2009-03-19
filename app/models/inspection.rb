class Inspection < ActiveRecord::Base
  
  #Associations
   belongs_to :cadet

   #Validations
   validates_associated :cadet
   validates_presence_of :score
   validates_numericality_of :score
end
