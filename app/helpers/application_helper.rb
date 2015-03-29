module ApplicationHelper
  def title(text)
    content_for(:page_title, text)
  end

  def background_image(image = nil)
    @background_image = image if image
    @background_image || rand(26)
  end

  def paginate(objects, options = {})
    options.reverse_merge!( theme: 'twitter-bootstrap-3' )
    super(objects, options)
  end

  def link_to_news(item)
    url = item['link']
    url = "https://www.facebook.com#{url}" if url.start_with?('/')
    service = URI.parse(url).hostname.gsub(/www\./i, '')
    link_to service.capitalize, url, target: '_blank'
  end
end
