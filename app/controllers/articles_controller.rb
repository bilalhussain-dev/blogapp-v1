class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :update, :show, :destroy]
  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    # debugger
    @article = Article.new(article_params)
    # @article.user = User.first
    if @article.save
      flash[:notice] = "Article is successfully created"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def  show

  end

  def edit
    # articles/id/edit

  end

  def update

    if @article.update(article_params)
      flash[:notice] = "Article successfully deleted"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy

    @article.destroy
    flash[:notice] = "Article is successfully deleted"
    redirect_to articles_path
  end


  private

  def set_article
    @article = Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:title, :description)
  end
end