class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)

    if @article.valid?
      redirect_to new_article_path
      flash[:notice] = "You've successfully create the article"
    else
      render :new
      flash[:error] = "Something went wrong"
    end
  end

  def index
    @articles = Article.all
  end

  private

  def article_params
    params.require(:article).permit(:title, :source, :abstract)
  end
end
