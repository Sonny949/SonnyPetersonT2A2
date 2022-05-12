class PostsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
before_action :check_auth
before_action :set_posts, only: [:show, :update]

  def index
    @posts = Post.order(:created_at)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def check_auth
    authorize Post
  end

  def set_posts
    @post = Post.find(params[:id])
  end
end
