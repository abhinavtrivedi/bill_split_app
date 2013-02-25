module ApplicationHelper
  def page_title(title)
    base_title = 'Bill Split App'
    if title.empty?
      base_title
    else
      "#{base_title} | #{title}"
    end
  end
end
