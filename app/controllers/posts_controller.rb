class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post=Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:notice] = "Your post has been created."
    redirect_to @post
    else
      flash[:alert] = "You have forgotten to upload an image!"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to(posts_path)
    if @post.save
      flash[:notice] = "Post updated!"
    end
  end


  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def show
    @post = Post.find(params[:id])
  end
end
