# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  #Helper to convert amt to pounds
  def pounds(amt)
    sprintf("£%0.2f", amt)
  end
end
