class CommentsController < ApplicationController

	http_basic_authenticate_with name: "1", password: "1", only: :destroy   ##仅仅只有删除的需要输入这个账号和密码

	def create
	    @article = Article.find(params[:article_id])
	    @comment = @article.comments.create(comment_params)
	    redirect_to article_path(@article)
	end
 

    def destroy
      @article = Article.find(params[:article_id])
	  @comment = @article.comments.find(params[:id])
	  @comment.destroy
	  redirect_to article_path(@article)
    end


  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

end
