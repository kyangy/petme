class CommentsController < ApplicationController

	def create
		post = Post.find(params[:post_id])
		post_comment = comment_params
		post_comment[:commenter] = current_user.name
		comment = post.comments.create(post_comment)
		redirect_to post_path(comment.post)
	end

	private

	def comment_params
		params.require(:comment).permit(:body)
	end
end
