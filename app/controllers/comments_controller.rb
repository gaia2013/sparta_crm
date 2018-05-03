class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @comment.customer
    else
      @customer = @comment.customer # フォームの入力内容代入
      @comments = @customer.comments
      # @comments = @comment.customer.comments
      #もしくは
      # @comments = Comment.where(customer_id: @comment.customer_id)
      render template: "customers/show"
        #ディレクトリをまたいで飛ばす場合はdirectoryとファイル名を記述する
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.customer
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :customer_id)
    end
end
