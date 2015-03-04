class CommentsController < ApplicationController
  before_action :set_comment, #only: [:edit, :update, :show, :destroy]

  def index
    @comments = Comment.all
    if @comments.present? 
      flash[:notice] = "Comments displayed successfully."
    else
      flash[:alert] = "Sorry there were no comments to display."
    end
  end


  def new
    if current_user
     @comment = Comment.new
     @article = Post.find(params[:article_id])
    else
      flash[:notice] = "Please sign in first."
      redirect_to signin_path
    end


  
  def edit
    if current_user == @comment.user
      set_comment
    else
      redirect_to @comment.post
    end
  end

  def show
  end

  def create
    @comment = Comment.create(comment_params)
    redirect_to @comment.post, notice: "New comment created."
  end

  def update
    @comment.update(comment_params)
    redirect_to @comments.post, notice: "Comment succesfully updated."
  end

  def destroy
    if current_user == @current.user
    set_comment
    @comment.destroy
    if @comment.destroy
      flash[:notice] = "Comment deleted successfully."
    else
      flash[:alert] = "There was a problem deleting your comment."
    end
    redirect_to article_path(@article)
  end
  
  private

    def set_comments
      @comment = Comment.find(params[:comment_id])
    end

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end

  def comment_params
    params.require(:comment).permit(:title, :body)
  end


