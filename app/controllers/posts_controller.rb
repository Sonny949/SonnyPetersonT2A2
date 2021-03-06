class PostsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
before_action :check_auth
before_action :set_posts, only: [:show, :update, :destroy, :edit]

  def index
    @posts = Post.order(:created_at).reverse_order
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.valid?
      redirect_to @post
    else
      flash.now[:alert] = @post.errors.full_messages.join('<br>')
      # so any entered form data stays on page
      render 'new'
    end
  end

  def edit
  end

  def update
    begin
    @post.update!(post_params)
    redirect_to @post
    rescue
      flash.now[:alert] = @post.errors.full_messages.join('<br>')
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def check_auth
    authorize Post
  end

  def set_posts
    @post = Post.find(params[:id])
  end

  def post_params 
    return params.require(:post).permit(:title, :description, :user_id, :image)
  end
end
