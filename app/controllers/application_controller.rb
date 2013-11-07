# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  before_filter :authenticate
  protect_from_forgery

  def site_name
    "Óptica"
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "kpa" && password == "arenakar"
    end
  end
end
