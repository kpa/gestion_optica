# -*- encoding : utf-8 -*-
# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  before_filter :authenticate

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'c9ceb2c1517e56913430f3b0390a627e'
  session :session_key => '_optica_session_id'

  def site_name
    "Óptica"
  end
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "kpa" && password == "arenakar"
    end
  end

end
