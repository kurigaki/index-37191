class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      redirect_to new_post_path
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path(@post.id)
    else
      @post = Post.find(params[:id])
      redirect_to  edit_post_path(@post.id)
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :text, :reference,:genre_id,:image).merge(user_id: current_user.id)
  end
end
