class SessionsController < ApplicationController

  def create
    #Authenticates user with login detailsfrom form.
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id #Sets user_id in the session hash so it can be reused.
      flash[:notice] = "Welcome to inspectr. Please email any comments or suggestions to <a href=\"mailto:#{ADMIN_EMAIL}\">#{ADMIN_EMAIL}</a>." #default flash message
      
      change = adjust_balances_if_monthchange(user) #See private methods, below.
      
      flash[:notice] = "Welcome to inspectr. All current cadet's balances have been decreased by #{help.pluralize(change, 'month')}." if change > 0 
      user.last_login = DateTime.now; user.save! #Update the lastlogin time
      redirect_to root_url
    else
      flash.now[:error] = "Sorry, Invalid login or password."
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to root_url
  end
end

#Private methods etc.
private

#Takes the User object and returns the months since last login.
def adjust_balances_if_monthchange(user)
  #Works out how many months have passed since last login. The formula ensures it works over new year. 
  months_since_last_login = (DateTime.now.year*12+DateTime.now.month) - (user.last_login.year*12+user.last_login.month)
  logger.debug "\nUpdated current cadets areers by #{months_since_last_login} months."
  
  #If no months have passed, this is skipped, otherwise the cadet balences are incremented.
  #Note that cadets marked as discharged aren't updated.
  months_since_last_login.times {
    current_user.cadets.each { |c| #updates the cadet's balances.
      c.balance = c.balance - user.amount_per_month unless c.discharged?; c.save!
    }
  }
  return months_since_last_login
end