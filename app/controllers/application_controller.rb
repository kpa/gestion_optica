class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  before_filter :authenticate
  protect_from_forgery
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def site_name
    "Óptica Arena"
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "kpa" && password == "arenakar"
    end
  end
end
