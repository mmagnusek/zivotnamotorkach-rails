require 'google/api_client'

class BlogPostFetcher

  ATTRIBUTES = %w(id title content labels etag published location)

  def call
    response = client.execute(
      http_method: :get,
      uri: "https://www.googleapis.com/blogger/v3/blogs/#{ENV['BLOG_ID']}/posts",
    )

    Array(JSON.parse(response.body)['items']).map do |blog_post|
      BlogPost.create_or_update_from_blogger blog_post.slice(*ATTRIBUTES)
    end
  end

  private

  def client
    @client ||= begin
      key    = OpenSSL::PKey::RSA.new ENV['GOOGLE_KEY'], ENV['GOOGLE_KEY_PASS']
      client = Google::APIClient.new(application_name: 'ZivotNaMotorkach.cz')
      client.authorization = Signet::OAuth2::Client.new(
        token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
        audience:             'https://accounts.google.com/o/oauth2/token',
        scope:                'https://www.googleapis.com/auth/blogger',
        issuer:               ENV['GOOGLE_ISSUER'],
        signing_key:          key
      )
      client.authorization.fetch_access_token!
      client
    end
  end
end




