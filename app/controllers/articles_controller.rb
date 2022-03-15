class ArticlesController < ApplicationController

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = "Article is successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def  show
    @article = Article.find(params[:id])
  end

  def edit
    # articles/id/edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article successfully deleted"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end


  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end