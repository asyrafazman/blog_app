class PostsController < ApplicationController
before_action :authenticate_user!, except: [ :index, :show ]
before_action :set_post, only: [ :show, :edit, :update, :destroy ]
before_action :authorize_user!, only: [ :edit, :update, :destroy ]

  # GET /posts
  def index
    @posts = Post.published.recent.page(params[:page]).per(10)

    # Handle search
    if params[:query].present?
      @posts = @posts.search_by_title_and_content(params[:query])
      @posts = @posts.page(params[:page]).per(10)
    end
  end

  # GET /posts/:id
  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user).recent
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
  end

  # GET /posts/:id/edit
  def edit
  end

  # POST /posts
  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/:id
  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/:id
  def destroy
    @post.destroy
    redirect_to posts_url, notice: "Post was successfully deleted."
  end

  private
  
  def set_post
    @post = Post.friendly.find(params[:id])
  end

  def authorize_user!
    unless @post.user == current_user
      redirect_to posts_path, alert: "You are not authorized to perform this action."
    end
  end

  def post_params
    params.require(:post).permit(:title, :content, :featured_image, :published_at)
  end
end
