class ArticlesController < ApplicationController
    before_action :current_user , only:[:show, :create, :index]
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    before_action :article_params, only: [:create,:update]
    before_action :banner_show, only: [:show,:index]
    def new
        @article = Article.new
    end
    def create
        @article = Article.new(article_params)
        @article.user = User.first
        if @article.save
            flash[:notice] = "Article was successfully created"
            redirect_to article_path(@article)
        else
            render 'new'
        end
      end
    def show
        @article.punch(request)
        @comment=Comment.new
    end
    def update
        if @article.update(article_params)
            flash[:success] = "Article was updated"
            redirect_to article_path(@article)
        else
            flash[:success] = "Article was not updated"
            render 'edit'
        end
    end
    def edit
    end
    def index
        if(params[:order]=="ASC")
            @articles=Article.sort_by_popularity('ASC').paginate(page: params[:page], per_page: 5)
        else 
            @articles=Article.sort_by_popularity('DESC').paginate(page: params[:page], per_page: 5)
        end
        #@articles = Article.order(sort).paginate(page: params[:page], per_page: 5)
    end
    def destroy
        @article.destroy
        flash[:success] = "Article was deleted"
        redirect_to articles_path
    end
    private
        def article_params
            params.require(:article).permit(:title, :description)
        end
        def set_article
            @article = Article.find(params[:id])
        end
end