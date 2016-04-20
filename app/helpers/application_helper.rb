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

end
