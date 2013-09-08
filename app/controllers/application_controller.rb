class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_i18n_locale_from_params


  def lang_change
    if I18n.locale.to_s == "ru"
      change_locale = "en"
    else
      change_locale = "ru"
    end

    if request.env['HTTP_REFERER'].nil?
      refer = "http://localhost:3000"
    else
      refer = request.env['HTTP_REFERER']
    end
    url_locale = refer.split('/')
    case url_locale[3]
      when "en"
        url_locale = url_locale.join('/')
        url_locale = refer.sub('en', 'ru')
        cookies[:language] = "ru"
      when "ru"
        url_locale = url_locale.join('/')
        url_locale = refer.sub('ru', 'en')
        cookies[:language] = "en"
      else
        url_locale = url_locale.join('/')
        url_locale = refer + "#{change_locale}"
        cookies[:language] = "#{change_locale}"
    end

    redirect_to "#{url_locale}"
  end

  protected

    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym)
          I18n.locale = params[:locale]
        else
          flash.now[:notice] = "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end

    def default_url_options
      { locale: I18n.locale }
    end



end
