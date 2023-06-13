module ApplicationHelper

  # return the suitable title per page
  def full_title(page_title = '')
    base_title = "C-memo"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
