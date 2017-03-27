class Admin::BlogPostsController < AdminController
  before_action :set_admin_blog_post, except: [:index, :new, :create]

  def index
    @blog_posts = BlogPost.page(params[:page])
  end

  def show
  end

  def new
    @blog_post = BlogPost.new
  end

  def edit
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)

    if @blog_post.save
      redirect_to [:admin, @blog_post], notice: 'Blog post was successfully created.'
    else
      render :new
    end
  end

  def update
    if @blog_post.update(blog_post_params)
      redirect_to [:admin, @blog_post], notice: 'Blog post was successfully updated.'
    else
      render :edit
    end
  end

  def publish
    @blog_post.touch(:published_at)
    redirect_to admin_blog_posts_url, notice: 'Blog post was successfully published.'
  end

  def destroy
    @blog_post.destroy
    redirect_to admin_blog_posts_url, notice: 'Blog post was successfully destroyed.'
  end

  private

  def set_admin_blog_post
    @blog_post = BlogPost.find_by(slug: params[:id])
  end

  def blog_post_params
    params.require(:blog_post).permit(:title, :slug, :body, :trip_id)
  end
end
