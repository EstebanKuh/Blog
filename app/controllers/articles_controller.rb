class ArticlesController < ApplicationController
  # Basic Authentication
  http_basic_authenticate_with name: "Admin", password: "@dmin123", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  # Route to Create
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  # Route to Update
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  # Route to Delete
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  #Filter params
  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end