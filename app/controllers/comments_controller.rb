class CommentsController < ApplicationController
    def create
        @article=Article.find(params[:article_id])
        @comment=@article.comments.create(comment_params)

        if @comment.save
            redirect_to article_path(@article)
        end
    end
    def destroy
        @article=Article.find(params[:article_id])
        @comment=Comment.find(comment_params)

        @comment.destroy

        redirect_to article_path(@article)
    end

    private
    def comment_params
        params.require(:comment).permit(:comment,:user_id)
    end

end
