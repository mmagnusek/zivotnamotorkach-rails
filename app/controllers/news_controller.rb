class NewsController < ApplicationController

  def index
    @news, @events = facebook_data
  end

  private

  def facebook_data
    Rails.cache.fetch 'news', expires_in: 5.minutes do
      [
        graph.get_connection('297942373675608', 'feed', fields: 'icon,picture,message,created_time,link'),
        graph.get_connection('297942373675608', 'events', time_filter: 'upcoming')
      ]
    end
  end

  def graph
    @graph ||= Koala::Facebook::API.new(ENV['FB_ACCESS_TOKEN'])
  end
end
