class CommentsController < ApplicationController


  def create
    comment = Comment.new(comment_params)
    comment.guide_id = params[:guide_id]
    me = current_user
    comment.title = User.find(me)

    if comment.save
      redirect_to guide_path(params[:guide_id])
    else
        redirect_to guide_path(params[:guide_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
