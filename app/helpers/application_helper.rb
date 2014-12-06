module ApplicationHelper
  def title(text)
    content_for(:page_title, text)
  end
end
