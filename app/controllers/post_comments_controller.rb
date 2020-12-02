class PostCommentsController < ApplicationController


	def create
		post = Post.find(params[:post_id])
		post_comment = current_user.post_comments.new(post_comment_params)
		post_comment.post_id = post.id
		post_comment.save
		redirect_to post_path(post)
	end

	def destroy
		post = Post.find(params[:post_id])
		post_comment = current_user.post_comments.find_by(post_id: post.id)
		post_comment.destroy
		redirect_to post_path(post)
	end

	private
	def post_comment_params
		params.require(:post_comment).permit(:comment, :user_id, :post_id)
	end
end
