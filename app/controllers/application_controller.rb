class ApplicationController < ActionController::Base
<<<<<<< HEAD
=======
  before_action :set_locale

  private

  def default_url_options
    {locale: I18n.locale}
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
>>>>>>> 73ec1e2 (MVC)
end
