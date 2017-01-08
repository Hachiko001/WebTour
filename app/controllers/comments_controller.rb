class CommentsController < ApplicationController


  def create
    comment = Comment.new(comment_params)
    comment.guide_id = params[:guide_id]

    if comment.save
      redirect_to guides_path(param[:guide_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
