module ApplicationHelper

  def full_title(page_title = '')
    base_title = "Remember App"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def flash_normal
    render "layouts/flashmessages"
  end

  def alternate_locales
    # Remove current locale from list
    aval_locales_but_current = I18n.available_locales - [locale]
    aval_locales_but_current.map{ |l| yield(l) }.join.html_safe
  end

end
