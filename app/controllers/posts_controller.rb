class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    #@post = Post.new(title: params[:post][:title], body: params[:post][:body], user_id: current_user.id)
    @post = Post.new(post_params.merge(user_id: current_user.id))

    if @post.save
      redirect_to action: "index"
    else
      render :new, status: :unprocessable_entity, plain: params
    end
  end

  def index
    @posts = Post.all
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
