class PostsController < ApplicationController


	def index
		@posts = Post.all
		@post = Post.new
	end

	def show
		@post = Post.find(params[:id])
		@post_comment = PostComment.new
		@post_comments = @post.post_comments
	end

	def create
		post = current_user.posts.new(post_params)
		post.save
		redirect_to posts_path
	end

	def update
	end

	def destroy
	end

	private
	def post_params
		params.require(:post).permit(:body, :user_id)
	end
end
