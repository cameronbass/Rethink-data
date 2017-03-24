class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    binding.pry
    @article = Article.create(article_params)

    if @article.valid?
      redirect_to new_article_path
      flash[:notice] = "You've successfully create the article"
    else
      render :new
      flash[:error] = "Something went wrong"
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :source, :abstract)
  end
end
