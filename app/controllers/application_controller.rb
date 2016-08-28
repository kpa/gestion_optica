class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery
  before_action :authenticate_user!
  before_action :set_locale
  before_filter :set_gettext_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def site_name
    "Óptica Arena"
  end
end
