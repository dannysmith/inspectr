class InspectionController < ApplicationController
  
  def create
    #looks at the params hash and creates new inspections for each cadet record. Cool.
    ok = true
    params[:cadet_score].each do |id,score|
      insp = Cadet.find(id).inspections.new(:date => Date.today, :score => score)
      (insp.authorized_absent = params[:cadet_aa].include?(id) ? true : false) unless params[:cadet_aa].nil?
      ok = insp.save! && !ok ? true : false
    end
    if ok
      flash[:notice] = "Successfully recorded inspection."
    else
      flash[:error] = "Sorry, there's been an error. The inspection was not added."
    end
    redirect_to root_url
  end
end
