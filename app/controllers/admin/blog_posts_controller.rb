class Admin::BlogPostsController < AdminController
  before_action :set_admin_blog_post, only: [:show, :edit, :update, :destroy]

  # GET /admin/blog_posts
  def index
    @blog_posts = BlogPost.page(params[:page])
  end

  # GET /admin/blog_posts/1
  def show
  end

  # GET /admin/blog_posts/new
  def new
    @blog_post = BlogPost.new
  end

  # GET /admin/blog_posts/1/edit
  def edit
  end

  # POST /admin/blog_posts
  def create
    @blog_post = BlogPost.new(blog_post_params)

    if @blog_post.save
      redirect_to [:admin, @blog_post], notice: 'Blog post was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/blog_posts/1
  def update
    if @blog_post.update(blog_post_params)
      redirect_to [:admin, @blog_post], notice: 'Blog post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/blog_posts/1
  def destroy
    @blog_post.destroy
    redirect_to admin_blog_posts_url, notice: 'Blog post was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_blog_post
      @blog_post = BlogPost.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def blog_post_params
      params.require(:blog_post).permit(:title, :slug, :body)
    end
end
