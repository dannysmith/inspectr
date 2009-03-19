class CadetsController < ApplicationController
  
  before_filter :login_required
  
  def index
    #Gets all cadets for the current user & assign the ammount per month to an instance variable.
    @cadets = current_user.cadets.sort_by { |c| c.surname }
    
    #Instance variable of all cadets not discharged.
    @current_cadets = current_user.cadets.find(:all, :conditions => {:discharged => false}).sort_by { |c| c.surname }
    @amount_per_month = current_user.amount_per_month
    logger.debug "Session User ID: #{current_user}"
  end
  
  def new
    @cadet = Cadet.new
  end
  
  def create
    #Creates a new cadet for the user from :params.
    @cadet = current_user.cadets.new(params[:cadet])
    if @cadet.save
      flash[:notice] = "Successfully created record for #{@cadet.firstname} #{@cadet.surname}."
      redirect_to root_url
    else
      render :new
    end
  end
  
  def edit
    @cadet = current_cadet
  end
  
  def update
    @cadet = current_cadet
    if @cadet.update_attributes(params[:cadet])
      flash[:notice] = "Successfully updated record for #{@cadet.firstname} #{@cadet.surname}."
      redirect_to root_url
    else
      render :edit
    end
  end
  
  def destroy
    @cadet = current_cadet
    @cadet.destroy
    flash[:notice] = "Successfully destroyed record for  #{@cadet.firstname} #{@cadet.surname}."
    redirect_to cadets_url
  end

  
  private
  #Returns the current cadet (throgh :params), only if it belongs to the current user.
  #If none is found, a mesage is shown and the user redirected to root.
  #This protects from users accesing other users cadets through the url.
  def current_cadet
    begin
        @cadet = current_user.cadets.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        flash[:error] = "None of your cadets have ID: #{params[:id]}"
        redirect_to root_url   
    end
  end
end