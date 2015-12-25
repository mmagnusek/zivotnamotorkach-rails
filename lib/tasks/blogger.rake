desc "Update feed"
task :fetch_blog_posts => :environment do
  puts "Fetching blogposts..."
  BlogPostFetcher.new.call
  puts "done."
end
