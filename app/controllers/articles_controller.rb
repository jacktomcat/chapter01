class ArticlesController < ApplicationController
  include Tools::Random

  http_basic_authenticate_with name: "1", password: "1", except: [:index, :show]  ##不登陆，仅仅只有 index  show 的操作权限

   def new
     @article = Article.new
   end
   
   def index
     message = '系统生成的随机数为：' + (generate_random).to_s
     puts message

     dt = Tools::DateUtils.new(' hello')
     t = dt.calculate_interval('20161229','20161220')
     puts t
     @articles = Article.all
   end   
   
   def create
      #render plain: params[:article].inspect
      @article = Article.new(article_params)
      if @article.save
         redirect_to @article
         #render 'index'
      else
         render 'new'
      end
   end

   def show
     @article = Article.find(params[:id])
   end

   def edit
     @article = Article.find(params[:id])
   end

   def update
     @article = Article.find(params[:id])
     if @article.update(title: 'test333')#只修改title的属性字段
     #if @article.update(article_params)
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
   def article_params
     params.require(:article).permit(:title, :text)
   end
end
