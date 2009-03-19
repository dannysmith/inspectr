class ApplicationController < ActionController::Base
  include Authentication
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'e9ae622150c2b942594e00c1fc0073e6'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
   
  #Makes helpers available in controller used as "help.pluralize()" etc...
  #Useful for pluralizing, mostly. Thanks to dzone snippets. DS
  def help
      Helper.instance
  end

  class Helper
    include Singleton
    include ActionView::Helpers::TextHelper
  end
  
end
