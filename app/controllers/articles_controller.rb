class ArticlesController < ApplicationController
    # perform this method before call other methods
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def show
        # params[:id] :get 'id' parameter from url
        # put '@' before a variable name to turn it into a instance variable in order to be able to use in show.html.erb
     end

    def index
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end

    def new
        # ※'if @article.errors.any?' in the new page makes an error, because when you redirect the new page, @article is not yet defined.
        # So, to prevent the Nil Error when showing the new page, you should make an instance.
        @article = Article.new
    end

    def create
        # To whitelist what's comming in from the the web by using params.require(:'specify the top level of key').permit('specefy the keys that you wants to permit')
        @article = Article.new(article_params)
        # temporarily hard coding
        @article.user = current_user
        if @article.save
            flash[:notice] = "Article was saved successfully. "
            #redirect_to 'Prefix_path of the page you want to redirect(in this case, you should specify the show page's Prefix and provide id)'
            # Or also you can write like 'redirect_to @article'
            redirect_to @article
        else
            # @article(instance variables that are made in this method) is gonna be available in new page
            render 'new'
        end
    end

    def edit
    end

    def update
        if @article.update(article_params)
            flash[:notice] = "Article was updated successfully. "
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description, category_ids: [])
    end

    def require_same_user
        if current_user != @article.user && !current_user.admin?
                flash[:alert] = "You can only edit or delete your own article"
                redirect_to @article
        end
    end
end