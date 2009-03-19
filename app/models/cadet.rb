class Cadet < ActiveRecord::Base
  #Associations
  belongs_to :user
  has_many :payments
  has_many :inspections
  
  #Validations
  validates_associated :user
  validates_presence_of :surname, :firstname, :email
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  
  #returns a cadets average inspection score as a float, rounded to 1dp.
  def average_score
    count = 0.0
    avrg = 0.0
    if self.inspections.empty?
      return 0.0
    else
      self.inspections.each do |insp|
        unless insp.authorized_absent?
          avrg += insp.score.to_f
          count += 1.0
        end
      end
      return count != 0.0 ? (avrg/count).round(1) : 0.0 #Stops problem dividing 0.0 by 0.0 if only authorised absences esist.
      
    end
  end

end
