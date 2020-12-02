class PostCommentsController < ApplicationController


	def create
	end

	def destroy
	end

	private
	def post_comment_params
		params.require(:post_comment).permit(:comment, :user_id, :post_id)
	end
end
