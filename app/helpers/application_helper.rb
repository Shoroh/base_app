module ApplicationHelper

  # Отображение почты пользователя (по-умолчанию), или имени компании (если она есть в профиле)
  def display_name
    if current_user.profile.company_name?
      return current_user.profile.company_name 
    else
      return current_user.email
    end
  end

  def rus_link
    url_locale = request.path.split('/')
    if url_locale[1] == "ru"
      url_locale[1] = "en"
      url_locale = url_locale.join('/')
      url_locale = "http://localhost:3000" + url_locale
    else
      url_locale[1] = "ru"
      url_locale = url_locale.join('/')
      url_locale = "http://localhost:3000" + url_locale
    end
  end


end
