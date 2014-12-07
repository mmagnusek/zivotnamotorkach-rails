module ApplicationHelper
  def title(text)
    content_for(:page_title, text)
  end

  def paginate(objects, options = {})
    options.reverse_merge!( theme: 'twitter-bootstrap-3' )
    super(objects, options)
  end
end
