class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)

    if @article.valid?
      redirect_to articles_path
      flash[:notice] = "You've successfully create the article"
    else
      redirect_to new_article_path
      flash[:error] = "An Error Has Occurred"
    end
  end

  def index
    @search = Article.search(params[:q])
    @articles = @search.result
  end

  def download
    article = Article.find_by(id: params[:id])

    data = File.read(open("https://s3.us-east-2.amazonaws.com/theranostics-bucket/uploads/#{article[:file]}"))
    send_data data, filename: "file.pdf", type: "application/pdf", disposition: 'inline', stream: 'true', buffer_size: '4096'
  end

  private

  def article_params
    params.require(:article).permit(:title, :source, :abstract, :publication_date, :file, :folder)
  end
end
