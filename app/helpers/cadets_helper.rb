module CadetsHelper

  #Returns discharged and/or standing_order classes, or an empty string.
  def display_classes(cadet)
    rstr = ""
    rstr << "discharged " if cadet.discharged?
    rstr << "standing_order " if cadet.standing_order?
    rstr = " class=\"#{rstr.strip}\"" unless rstr == ""
    return rstr
  end
  
  #Returns an image depending on the standing order?
  def so_image(cadet)
    #IF cadet pays by so, return yes.gif, else return no.gif.
    if cadet.standing_order?
      return image_tag("/images/yes.gif", :border=>0)
    else
      return image_tag("/images/no.gif", :border=>0)
    end
  end
  
  def scores_to_display(cadet)
    array = ["","","",""]
    unless cadet.inspections.empty?
      inspections = cadet.inspections.sort_by { |c| c.date }
      i = 1
      #Number of past inspections to display on home screen
      4.times do
        begin
          inspections[-i].authorized_absent? ? array[-i] = "AA" : array[-i] = inspections[-i].score.to_s
          i += 1
        rescue
          #do nothing
        end
      end
    end
    return_str = ""
    user_avrg = current_user.average_score
    array.each do |i|
      if (i != "AA" && i.to_f < user_avrg)
        return_str << "<td class=\"low_score\">"
      else
        return_str << "<td>"
      end
      return_str << "#{i}</td>\n"
    end
    return return_str
  end
    
    
end
