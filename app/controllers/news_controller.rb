class NewsController < ApplicationController

  def index
    @news, @events = facebook_data
  end

  private

  def facebook_data
    Rails.cache.fetch 'news', expires_in: 5.minutes do
      [
        graph.graph_call('297942373675608/feed').select{|i| i['message']},
        graph.graph_call('297942373675608/events')
      ]
    end
  end

  def graph
    @graph ||= Koala::Facebook::API.new(ENV['FB_ACCESS_TOKEN'])
  end
end
