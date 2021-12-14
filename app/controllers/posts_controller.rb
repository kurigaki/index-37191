class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
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
      redirect_to edit_post_path(@post.id)
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def search
    if params[:q]&.dig(:title)
      squished_keywords = params[:q][:title].squish
      params[:q][:title_cont_any] = squished_keywords.split(" ")
    end
    @q = Post.ransack(params[:q])
    @posts = @q.result.order('created_at DESC')
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :reference, :genre_id, :image).merge(user_id: current_user.id)
  end
end
