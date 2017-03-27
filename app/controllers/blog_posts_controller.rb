class BlogPostsController < ApplicationController
  def index
    @blog_posts = BlogPost.published.newest_first.page(params[:page])
  end

  def show
    @blog_post = BlogPost.find_by!(slug: params[:id])
  end
end
