class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    puts current_user
    @user = current_user
    @post = @user.posts.new(post_params)

    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
