class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :authenticate_admin!, except: [:show, :index]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def show
  end

  def update
  @article.update(params[:article])
  redirect_to articles_path, notice: "Article succesfully updated."
  end

  def create
  @article = Article.create(article_params)
  redirect_to articles_path, notice: "New article created."
  end

  def destroy
  @article.destroy
  redirect_to articles_path, notice: "Article deleted."
  end


private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body).merge(user_id: current_user.id)
  end
end




